//widgets/hourly_data_widget.dart
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/controller/global_controller.dart';
import 'package:weatherapp_starter_project/model/weather_data_hourly.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

class HourlyDataWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  HourlyDataWidget({Key? key, required this.weatherDataHourly})
      : super(key: key);

  // card index
  RxInt cardIndex = GlobalController().getIndex();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          alignment: Alignment.topCenter,
          child: const Text("Today", style: TextStyle(fontSize: 18)),
        ),
        hourlyList(),
      ],
    );
  }

  Widget hourlyList() {
    return Container(
      height: 160,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherDataHourly.hourly.length > 12
            ? 14
            : weatherDataHourly.hourly.length,
        itemBuilder: (context, index) {
          return Obx(() => GestureDetector(
            onTap: () {
              cardIndex.value = index;
            },
            child: Container(
              width: 90,
              margin: const EdgeInsets.only(left: 20, right: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
               // boxShadow: const [
                //  BoxShadow(
                 //   offset: const Offset(0.5, 0),
                  //  blurRadius: 30,
                   // spreadRadius: 1,
                   // color: CustomColors.dividerLine.withAlpha(150),
                 // ),
               // ],
                color: cardIndex.value == index
                    ? CustomColors.firstGradientColor
                    : Theme.of(context).cardColor,
                // Change the background color to dark
                // Use the dark color you want, for example:
                // color: Colors.grey[900],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(getTime(
                      weatherDataHourly.hourly[index].dt!,
                    ),
                        style: TextStyle(
                          color: cardIndex == index
                              ? Colors.white
                              : CustomColors.textColorBlack,
                        )),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: Image.asset(
                      "assets/weather/${weatherDataHourly.hourly[index].weather![0].icon!}.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "${weatherDataHourly.hourly[index].temp!}°",
                      style: TextStyle(
                        color: cardIndex == index
                            ? Colors.white
                            : CustomColors.textColorBlack,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }

  String getTime(int timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String x = DateFormat('jm').format(time);
    return x;
  }
}


