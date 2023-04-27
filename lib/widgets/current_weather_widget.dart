import 'package:crop_disease_detection/model/weather_data_current.dart';
import 'package:crop_disease_detection/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const CurrentWeatherWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  sunrise() {
    final int? sunrise = weatherDataCurrent.current.sunrise;
    final DateTime sunriseTime =
        DateTime.fromMillisecondsSinceEpoch(sunrise! * 1000);
    return sunriseTime;
  }

  sunset() {
    final int? sunset = weatherDataCurrent.current.sunset;
    final DateTime sunsetTime =
        DateTime.fromMillisecondsSinceEpoch(sunset! * 1000);
    return sunsetTime;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
              height: 100,
              width: 100,
            ),
            Container(
              height: 50,
              width: 1,
              color: CustomColors.dividerLine,
            ),
            Column(
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "${weatherDataCurrent.current.temp!.toInt()}°C",
                      style: const TextStyle(
                          color: CustomColors.textColorBlack,
                          fontWeight: FontWeight.w600,
                          fontSize: 68)),
                ])),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text:
                          "${weatherDataCurrent.current.weather![0].description}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 20))
                ]))
              ],
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: Divider(
            thickness: 1,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      color: CustomColors.cardColor,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Image.asset("assets/icons/windspeed.png"),
                ),
                Container(
                  height: 60,
                  width: 60,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      color: CustomColors.cardColor,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Image.asset("assets/icons/clouds.png"),
                ),
                Container(
                  height: 60,
                  width: 60,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      color: CustomColors.cardColor,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Image.asset("assets/icons/humidity.png"),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 20,
                  width: 60,
                  child: Text(
                    "${weatherDataCurrent.current.windSpeed}km/h",
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 60,
                  child: Text(
                    "${weatherDataCurrent.current.clouds}%",
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 60,
                  child: Text(
                    "${weatherDataCurrent.current.humidity}%",
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              child: Divider(
                thickness: 1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Image.asset(
                        "assets/icons/sunrise.png",
                      ),
                    ),
                    const SizedBox(width: 10),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                          width: 65,
                          child: Text(
                            'sunrise'.tr,
                            style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          width: 80,
                          child: Text(
                            DateFormat('h:mm a').format(sunrise()),
                            style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Image.asset(
                        "assets/icons/sunset.png",
                      ),
                    ),
                    const SizedBox(width: 10),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                          width: 65,
                          child: Text(
                            'sunset'.tr,
                            style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          width: 80,
                          child: Text(
                            DateFormat('h:mm a').format(sunset()),
                            style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              child: Divider(
                thickness: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}