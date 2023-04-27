import 'package:crop_disease_detection/controller/global_controller.dart';
import 'package:crop_disease_detection/model/weather_data_hourly.dart';
import 'package:crop_disease_detection/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HourlyWeatherWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  HourlyWeatherWidget({Key? key, required this.weatherDataHourly})
      : super(key: key);

  RxInt cardIndex = GlobalController().getIndex();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          alignment: Alignment.topCenter,
          child: Text(
            'today'.tr,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        Container(
          height: 160,
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: weatherDataHourly.hourly.length > 12
                  ? 14
                  : weatherDataHourly.hourly.length,
              itemBuilder: (context, index) {
                return Obx((() => GestureDetector(
                    onTap: () {
                      cardIndex.value = index;
                    },
                    child: Container(
                      width: 90,
                      margin: const EdgeInsets.only(left: 20, right: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                                color: CustomColors.dividerLine.withAlpha(150),
                                blurRadius: 2.0,
                                spreadRadius: 0.0,
                                offset: const Offset(2.0, 2.0),
                            )
                          ],
                          gradient: cardIndex.value == index
                              ? const LinearGradient(colors: [
                                  CustomColors.firstGradientColor,
                                  CustomColors.secondGradientColor
                                ])
                              : null),
                      child: HourlyDetails(
                        index: index,
                        cardIndex: cardIndex.toInt(),
                        temp: weatherDataHourly.hourly[index].temp!,
                        timeStamp: weatherDataHourly.hourly[index].dt!,
                        weatherIcon:
                            weatherDataHourly.hourly[index].weather![0].icon!,
                      ),
                    ))));
              }),
        )
      ],
    );
  }
}

class HourlyDetails extends StatelessWidget {
  int temp;
  int index;
  int cardIndex;
  int timeStamp;
  String weatherIcon;
  String getTime(final timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String x = DateFormat.jm().format(time);
    return x;
  }

  HourlyDetails(
      {Key? key,
      required this.index,
      required this.cardIndex,
      required this.temp,
      required this.timeStamp,
      required this.weatherIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            getTime(timeStamp), 
            style: TextStyle(
              color: cardIndex == index 
                  ? Colors.white 
                  : CustomColors.textColorBlack
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: Image.asset(
            "assets/weather/$weatherIcon.png",
            height: 40,
            width: 40,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            "$temp°C",
            style: TextStyle(
              color: cardIndex == index 
                  ? Colors.white 
                  : CustomColors.textColorBlack
            ),
          ),
        )
      ],
    );
  }
}
