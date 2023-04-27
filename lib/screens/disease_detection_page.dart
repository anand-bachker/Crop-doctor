import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/disease_image_widget.dart';

// add comment below

// class for disease detection page
class DiseaseDetectionPage extends StatefulWidget {
  final File? image; // image file
  final Future<dynamic> futureResult; // future result

  const DiseaseDetectionPage({
    Key? key, // key
    required this.image, // image
    required this.futureResult, // future result
  }) : super(key: key); // super key

  @override
  State<DiseaseDetectionPage> createState() => _DiseaseDetectionPageState();
}

class _DiseaseDetectionPageState extends State<DiseaseDetectionPage>
    with WidgetsBindingObserver {
  String? classValue;
  String? confidenceScore;
  String symptomRecordingLink = ''; // symptom recording link
  bool isPlaying = false; // is playing
  final AudioPlayer _audioPlayer = AudioPlayer(); // audio player
  String filePath = ''; // file path

  @override
  void initState() {
    super.initState();
    widget.futureResult.then((result) {
      var responseJson = json.decode(result);
      if (responseJson.containsKey("Class") &&
          responseJson.containsKey("Confidence score") &&
          responseJson.containsKey("Symptom Recording Link")) {
        // if response json contains key
        setState(() {
          classValue = responseJson['Class'];
          confidenceScore = responseJson['Confidence score'];
          symptomRecordingLink = responseJson['Symptom Recording Link'];
        });
      } else {
        // else
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('exception3'.tr)));
      }
    });

    WidgetsBinding.instance.addObserver(this);
    _audioPlayer.onPlayerStateChanged.listen((event) {
      // audio player on player state changed
      if (event == PlayerState.playing) {
        setState(() {
          isPlaying = true; // is playing
        });
      } else if (event == PlayerState.stopped) {
        setState(() {
          isPlaying = false; // is playing
        });
      } else {
        setState(() {
          isPlaying = false; // is playing
        });
      }
    });
  }

  @override
  void dispose() {
    // dispose for audio player
    WidgetsBinding.instance.removeObserver(this);
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // did change app life cycle state
    if (state == AppLifecycleState.paused) {
      _audioPlayer.stop();
    }
  }

  Future<void> playAudio(filePath) async {
    // play audio
    var data = await rootBundle.load(filePath);
    Uint8List bytes = data.buffer.asUint8List();
    await _audioPlayer.play(BytesSource(bytes));
    setState(() {
      isPlaying = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // build
    final size = MediaQuery.of(context).size;
    String classValueText = '';
    if (classValue == "Bactrial Leaf Blight") {
      // if class value is bactrial leaf blight
      classValueText = 'blb_diagnosis'.tr;
      filePath = "assets/audio/blb.MP3";
    } else if (classValue == "Leaf Blast") {
      // else if class value is leaf blast
      classValueText = 'lb_diagnosis'.tr;
      filePath = "assets/audio/lb.MP3";
    } else if (classValue == "Brown Spot") {
      // else if class value is brown spot
      classValueText = 'bs_diagnosis'.tr;
      filePath = "assets/audio/bs.MP3";
    } else if (classValue == "False Smut") {
      classValueText = 'fs_diagnosis'.tr;
      filePath = "assets/audio/fs.MP3";
    } else if (classValue == "Sheath Blight") {
      classValueText = 'sb_diagnosis'.tr;
      filePath = "assets/audio/sb.MP3";
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          'disease_diagnosis'.tr,
          style: GoogleFonts.raleway(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: classValue == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              // main component for single child view
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          Color.fromARGB(255, 211, 255, 212),
                          Colors.white
                        ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)), // gradient color
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            if (classValue ==
                                    "Bactrial Leaf Blight" || // if class value is bactrial leaf blight
                                classValue == "Leaf Blast" ||
                                classValue == "Brown Spot" ||
                                classValue == "False Smut" ||
                                classValue == "Sheath Blight")
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.file(
                                      widget.image!,
                                      height: 190,
                                      width: 190,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'uploaded_image'.tr,
                                    style: GoogleFonts.raleway(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            if (classValue ==
                                "Bactrial Leaf Blight") // if class value is bactrial leaf blight
                              const DiseaseImageWidget(
                                image: "assets/images/blb_main.jpg", // image
                              )
                            else if (classValue ==
                                "Leaf Blast") // class value is leaf blast
                              const DiseaseImageWidget(
                                image: "assets/images/lb_main.jpg", // image
                              )
                            else if (classValue ==
                                "Brown Spot") // class value is brown spot
                              const DiseaseImageWidget(
                                image: "assets/images/bs_main.jpg", // image
                              )
                            else if (classValue ==
                                "False Smut") // if false smut
                              const DiseaseImageWidget(
                                image: "assets/images/fs_main.jpg",
                              )
                            else if (classValue == "Sheath Blight")
                              const DiseaseImageWidget(
                                image: "assets/images/sb_main.jpg",
                              )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          classValueText,
                          style: GoogleFonts.raleway(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'confidence'.tr + confidenceScore!,
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Divider(thickness: 1),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'management'.tr,
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w600, fontSize: 20),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (isPlaying) {
                                        _audioPlayer.stop();
                                        setState(() {
                                          isPlaying = false;
                                        });
                                      } else {
                                        playAudio(filePath);
                                      }
                                    },
                                    child: isPlaying
                                        ? Icon(
                                            CupertinoIcons.stop_circle,
                                            color: Colors.black,
                                            size: 70,
                                            shadows: [
                                              BoxShadow(
                                                color: Colors.grey.shade500,
                                                offset: Offset(3.0, 3.0),
                                                blurRadius: 5.0,
                                              ),
                                            ],
                                          )
                                        : Icon(
                                            CupertinoIcons.play_circle,
                                            color: Colors.black,
                                            size: 70,
                                            shadows: [
                                              BoxShadow(
                                                color: Colors.grey.shade500,
                                                offset: Offset(3.0, 3.0),
                                                blurRadius: 5.0,
                                              ),
                                            ],
                                          ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  isPlaying
                                      ? Text(
                                          'tap_to_stop'.tr,
                                          style:
                                              GoogleFonts.raleway(fontSize: 11),
                                        )
                                      : Text(
                                          'tap_to_play'.tr,
                                          style:
                                              GoogleFonts.raleway(fontSize: 11),
                                        ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Divider(thickness: 1),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'preventive'.tr,
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w600, fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        if (classValue == "Bactrial Leaf Blight")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('blb_preventive1'.tr),
                          )
                        else if (classValue == "Leaf Blast")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('lb_preventive1'.tr),
                          )
                        else if (classValue == "Brown Spot")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('bs_preventive1'.tr),
                          )
                        else if (classValue == "False Smut")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('fs_preventive1'.tr),
                          )
                        else if (classValue == "Sheath Blight")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('sb_preventive1'.tr),
                          ),
                        const SizedBox(height: 5),
                        if (classValue == "Bactrial Leaf Blight")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('blb_preventive2'.tr),
                          )
                        else if (classValue == "Leaf Blast")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('lb_preventive2'.tr),
                          )
                        else if (classValue == "Brown Spot")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('bs_preventive2'.tr),
                          )
                        else if (classValue == "False Smut")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('fs_preventive2'.tr),
                          )
                        else if (classValue == "Sheath Blight")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('sb_preventive2'.tr),
                          ),
                        const SizedBox(height: 5),
                        if (classValue == "Bactrial Leaf Blight")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('blb_preventive3'.tr),
                          )
                        else if (classValue == "Leaf Blast")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('lb_preventive3'.tr),
                          )
                        else if (classValue == "Brown Spot")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('bs_preventive3'.tr),
                          )
                        else if (classValue == "False Smut")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('fs_preventive3'.tr),
                          )
                        else if (classValue == "Sheath Blight")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('sb_preventive3'.tr),
                          ),
                        const SizedBox(height: 5),
                        if (classValue == "Bactrial Leaf Blight")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('blb_preventive4'.tr),
                          )
                        else if (classValue == "Leaf Blast")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('lb_preventive4'.tr),
                          )
                        else if (classValue == "Brown Spot")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('bs_preventive4'.tr),
                          )
                        else if (classValue == "False Smut")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('fs_preventive4'.tr),
                          ),
                        const SizedBox(height: 5),
                        if (classValue == "Bactrial Leaf Blight")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('blb_preventive5'.tr),
                          )
                        else if (classValue == "Leaf Blast")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('lb_preventive5'.tr),
                          )
                        else if (classValue == "False Smut")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('fs_preventive5'.tr),
                          ),
                        const SizedBox(height: 5),
                        if (classValue == "Leaf Blast")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('lb_preventive6'.tr),
                          ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'cultural'.tr,
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w600, fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        if (classValue == "Bactrial Leaf Blight")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('blb_cultural1'.tr),
                          )
                        else if (classValue == "Leaf Blast")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('lb_cultural1'.tr),
                          )
                        else if (classValue == "Brown Spot")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('bs_cultural1'.tr),
                          )
                        else if (classValue == "False Smut")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('fs_cultural1'.tr),
                          )
                        else if (classValue == "Sheath Blight")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('sb_cultural1'.tr),
                          ),
                        const SizedBox(height: 5),
                        if (classValue == "Bactrial Leaf Blight")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('blb_cultural2'.tr),
                          )
                        else if (classValue == "Leaf Blast")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('lb_cultural2'.tr),
                          )
                        else if (classValue == "Brown Spot")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('bs_cultural2'.tr),
                          )
                        else if (classValue == "False Smut")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('fs_cultural2'.tr),
                          )
                        else if (classValue == "Sheath Blight")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('sb_cultural2'.tr),
                          ),
                        const SizedBox(height: 5),
                        if (classValue == "Bactrial Leaf Blight")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('blb_cultural3'.tr),
                          )
                        else if (classValue == "Leaf Blast")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('lb_cultural3'.tr),
                          )
                        else if (classValue == "Brown Spot")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('bs_cultural3'.tr),
                          )
                        else if (classValue == "False Smut")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('fs_cultural3'.tr),
                          )
                        else if (classValue == "Sheath Blight")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('sb_cultural3'.tr),
                          ),
                        const SizedBox(height: 5),
                        if (classValue == "Bactrial Leaf Blight")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('blb_cultural4'.tr),
                          )
                        else if (classValue == "Leaf Blast")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('lb_cultural4'.tr),
                          )
                        else if (classValue == "Brown Spot")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('bs_cultural4'.tr),
                          )
                        else if (classValue == "False Smut")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('fs_cultural4'.tr),
                          )
                        else if (classValue == "Sheath Blight")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('sb_cultural4'.tr),
                          ),
                        const SizedBox(height: 5),
                        if (classValue == "Bactrial Leaf Blight")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('blb_cultural5'.tr),
                          )
                        else if (classValue == "Leaf Blast")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('lb_cultural5'.tr),
                          )
                        else if (classValue == "Brown Spot")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('bs_cultural5'.tr),
                          )
                        else if (classValue == "False Smut")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('fs_cultural5'.tr),
                          )
                        else if (classValue == "Sheath Blight")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('sb_cultural5'.tr),
                          ),
                        const SizedBox(height: 5),
                        if (classValue == "Brown Spot")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('bs_cultural6'.tr),
                          ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'chemical'.tr,
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w600, fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        if (classValue == "Bactrial Leaf Blight")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('blb_chemical1'.tr),
                          )
                        else if (classValue == "Leaf Blast")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('lb_chemical1'.tr),
                          )
                        else if (classValue == "Brown Spot")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('bs_chemical1'.tr),
                          )
                        else if (classValue == "False Smut")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('fs_chemical1'.tr),
                          )
                        else if (classValue == "Sheath Blight")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('sb_chemical1'.tr),
                          ),
                        const SizedBox(height: 5),
                        if (classValue == "Bactrial Leaf Blight")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('blb_chemical2'.tr),
                          )
                        else if (classValue == "Leaf Blast")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('lb_chemical2'.tr),
                          )
                        else if (classValue == "Brown Spot")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('bs_chemical2'.tr),
                          )
                        else if (classValue == "False Smut")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('fs_chemical2'.tr),
                          )
                        else if (classValue == "Sheath Blight")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('sb_chemical2'.tr),
                          ),
                        const SizedBox(height: 5),
                        if (classValue == "Bactrial Leaf Blight")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('blb_chemical3'.tr),
                          )
                        else if (classValue == "Leaf Blast")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('lb_chemical3'.tr),
                          )
                        else if (classValue == "Brown Spot")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('bs_chemical3'.tr),
                          )
                        else if (classValue == "False Smut")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('fs_chemical3'.tr),
                          )
                        else if (classValue == "Sheath Blight")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('sb_chemical3'.tr),
                          ),
                        const SizedBox(height: 5),
                        if (classValue == "Bactrial Leaf Blight")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('blb_chemical4'.tr),
                          )
                        else if (classValue == "Leaf Blast")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('lb_chemical4'.tr),
                          )
                        else if (classValue == "Brown Spot")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('bs_chemical4'.tr),
                          )
                        else if (classValue == "False Smut")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('fs_chemical4'.tr),
                          )
                        else if (classValue == "Sheath Blight")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('sb_chemical4'.tr),
                          ),
                        const SizedBox(height: 5),
                        if (classValue == "Bactrial Leaf Blight")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('blb_chemical5'.tr),
                          )
                        else if (classValue == "Leaf Blast")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('lb_chemical5'.tr),
                          )
                        else if (classValue == "Brown Spot")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('bs_chemical5'.tr),
                          )
                        else if (classValue == "False Smut")
                          ListTile(
                            leading: const Icon(Icons.fiber_manual_record),
                            title: Text('fs_chemical5'.tr),
                          ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
