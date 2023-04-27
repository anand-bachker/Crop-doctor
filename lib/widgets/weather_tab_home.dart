import 'package:crop_disease_detection/screens/weather_page.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controller/global_controller.dart';
import '../model/weather_data_current.dart';

class WeatherTab extends StatefulWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const WeatherTab({
    Key? key, required this.weatherDataCurrent,
  }) : super(key: key);

  @override
  State<WeatherTab> createState() => _WeatherTabState();
}

class _WeatherTabState extends State<WeatherTab> {

  String city = "";
  String date = DateFormat.yMMMMd().format(DateTime.now());

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getAddress(globalController.getLatitude().value,
        globalController.getLongitude().value);
    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemark[0];
    setState(() {
      city = place.locality!;
    });
  }

  sunset() {
    final int? sunset = widget.weatherDataCurrent.current.sunset;
    final DateTime sunsetTime =
        DateTime.fromMillisecondsSinceEpoch(sunset! * 1000);
    return sunsetTime;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WeatherPage()));
        });
      },
      child: Container(
          height: 140,
          width: 400,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 219, 241, 252),
                Color.fromARGB(255, 185, 233, 255)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            ),
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 155, 197, 255),
                offset: Offset(0, 25),
                blurRadius: 10,
                spreadRadius: -20,
              ),
            ],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -35,
                left: 20,
                child: Image.asset("assets/weather/${widget.weatherDataCurrent.current.weather![0].icon}.png")
              ),
              Positioned(
                top: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Text(
                        "${widget.weatherDataCurrent.current.temp!.toInt()}°C",
                        style: const TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                        ) ,
                      ),
                    )
                  ],
                )
              ),
              Positioned(
                top: 85,
                right: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'sunset'.tr,
                        style: const TextStyle(
                          fontSize: 13,
                          fontStyle: FontStyle.italic
                        ),
                    ),
                    Text(
                        DateFormat('h:mm a').format(sunset()),
                        style: const TextStyle(
                          fontSize: 13,
                          fontStyle: FontStyle.italic
                        ),
                    ),
                  ],
                )
              ),
              Positioned(
                top: 60,
                left: 25,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Text(
                        city,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ) ,
                      ),
                    )
                  ],
                )
              ),
              Positioned(
                top: 85,
                left: 25,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Text(
                        date,
                        style: const TextStyle(
                          fontSize: 14,
                        ) ,
                      ),
                    )
                  ],
                )
              ),
              Positioned(
                top: 110,
                left: 25,
                right: 20,
                child: Container(
                  margin: const EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                  height: 1,
                  color: Colors.black,
                )
              ),
              Positioned(
                top: 115,
                left: 25,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Text(
                        "${widget.weatherDataCurrent.current.weather![0].description}",
                        style: const TextStyle(
                          fontSize: 11,
                          fontStyle: FontStyle.italic
                        ) ,
                      ),
                    )
                  ],
                )
              ),
              Positioned(
                top: 115,
                right: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/icons/humidity.png",
                      height: 20,
                    ),
                    const SizedBox(width: 5,),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Text(
                        "${widget.weatherDataCurrent.current.humidity!.toDouble()}%",
                        style: const TextStyle(
                          fontSize: 11,
                        ) ,
                      ),
                    )
                  ],
                )
              ),
            ],
          ),
        ),
    );
  }
}