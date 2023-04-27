import 'package:crop_disease_detection/screens/edit_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {},
              child: DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 137, 255, 124),
                            Colors.white,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      border: Border(
                          bottom: BorderSide(color: Colors.black, width: 0.2))),
                  accountName: Text('name'.tr,
                      style: GoogleFonts.raleway(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                  accountEmail: Text('name_email'.tr,
                      style: GoogleFonts.raleway(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400)),
                  margin: EdgeInsets.zero,
                  currentAccountPicture: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(width: 0.5),
                        image: const DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage("assets/images/profile.png"))),
                  ),
                ),
              ),
            ),
            DrawerElement(
              icon: CupertinoIcons.info,
              name: 'about_app'.tr,
              onPress: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Center(
                        child: Text(
                          'about_app'.tr,
                          style: GoogleFonts.raleway(
                            fontWeight: FontWeight.bold, fontSize: 25
                          ),
                        )
                      ),
                      content: Text(
                        'app_desc'.tr,
                        style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w500, fontSize: 16
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      actions: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 16, 160, 0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            fixedSize: const Size(100, 30)),
                          child: Text(
                            'close'.tr, 
                            style: GoogleFonts.raleway(
                              fontSize: 15, fontWeight: FontWeight.w600
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  });
              },
              endIcon: true,
            ),
            DrawerElement(
              icon: CupertinoIcons.profile_circled,
              name: 'edit_profile'.tr,
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditProfileScreen()));
              },
              endIcon: true,
            ),
            DrawerElement(
              icon: CupertinoIcons.mail,
              name: 'mail_us'.tr,
              onPress: () async {
                const String url =
                    'mailto:srinu@iiitnr.edu.in?subject=Greetings';
                Uri uri = Uri.parse(url);
                if (await launchUrl(uri)) {
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:
                            Text('mail_error'.tr)));
                }
              },
              endIcon: true,
            ),
            DrawerElement(
              icon: Icons.settings,
              name: 'settings'.tr,
              onPress: () {
                openAppSettings();
              },
              endIcon: true,
            ),
            DrawerElement(
              icon: Icons.help_outline,
              name: 'help'.tr,
              onPress: () {},
              endIcon: true,
            ),
            DrawerElement(
              icon: const IconData(0xf88b, fontFamily: 'MaterialIcons'),
              name: 'logout'.tr,
              onPress: () {
                // AuthenticationRepository.instance.logout();
              },
              endIcon: false,
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerElement extends StatelessWidget {
  final IconData icon;
  final String name;
  final VoidCallback onPress;
  final bool endIcon;
  const DrawerElement({
    Key? key,
    required this.icon,
    required this.name,
    required this.onPress,
    required this.endIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: endIcon
                ? const Color.fromARGB(255, 16, 160, 0).withOpacity(0.1)
                : Colors.red.withOpacity(0.1)),
        child: Icon(
          icon,
          color: endIcon ? const Color.fromARGB(255, 16, 160, 0) : Colors.red,
        ),
      ),
      title: Text(name,
          style: GoogleFonts.raleway(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500)),
      onTap: onPress,
      trailing: endIcon
          ? Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withOpacity(0.1)),
              child: const Icon(Icons.navigate_next, color: Colors.grey),
            )
          : null,
    );
  }
}
