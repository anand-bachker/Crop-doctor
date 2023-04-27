import 'package:crop_disease_detection/screens/HomePages/first_homepage.dart';
import 'package:crop_disease_detection/screens/HomePages/third_homepage.dart';
import 'package:crop_disease_detection/screens/HomePages/second_homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pages = [
    const FirstHomePage(),
    const SecondHomePage(),
    const ThirdHomePage(),
  ];

  int selectedTab = 0;

  void onTap(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedTab],
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.white),
          child: BottomNavigationBar(
              onTap: onTap,
              currentIndex: selectedTab,
              unselectedFontSize: 12,
              selectedFontSize: 16,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
              showUnselectedLabels: true,
              selectedItemColor: const Color.fromARGB(255, 16, 160, 0),
              unselectedItemColor: Colors.black,
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/icons/plant.svg",
                      height: 30,
                      color: selectedTab == 0
                          ? const Color.fromARGB(255, 16, 160, 0)
                          : Colors.black,
                    ),
                    label: 'your_crops'.tr),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/icons/news.svg",
                      height: 30,
                      color: selectedTab == 1
                          ? const Color.fromARGB(255, 16, 160, 0)
                          : Colors.black,
                    ),
                    label: 'news'.tr),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person_outline_rounded,
                      size: 30,
                      color: selectedTab == 2
                          ? const Color.fromARGB(255, 16, 160, 0)
                          : Colors.black,
                    ),
                    label: 'you'.tr),
              ])),
    );
  }
}
