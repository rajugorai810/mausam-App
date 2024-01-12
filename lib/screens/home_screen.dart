import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/controller/global_controller.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/utils/custom_color.dart';
import 'package:weatherapp_starter_project/widgets/comfort_level.dart';
import 'package:weatherapp_starter_project/widgets/hourly_data-widget.dart';

import '../widgets/current_weather_widget.dart';
import '../widgets/daily_data_forecast.dart';
import '../widgets/header_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// call
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => globalController.checkLoading().isTrue
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Mausam App", style: TextStyle(fontSize: 30, color: CustomColors.textColorBlack),textAlign: TextAlign.center,),
                      Image.asset("assets/weather/11d.png",
                      height: 200,
                      width: 200,),
                      const CircularProgressIndicator()
                    ],
                  ),
                )
              : Center(
                child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      HeaderWidget(),
              
                      // for our current temperature
                      CurrentWeatherWidget(
                        weatherDataCurrent: globalController.getData().getCurrentWeather(),
                      ),
                      SizedBox(height: 20,),
                      HourlyDataWidget(
                        weatherDataHourly: globalController.getData().getHourlyWeather(),
                        ),

                      DailyDataForecast(
                        weatherDataDaily: globalController.getData().getDailyWeather(),
                      ),
                      Container(
                        height: 1,
                        color: CustomColors.dividerLine,
                      ),
                      SizedBox(height: 10,),
                      ConfortLevel(
                        weatherDataCurrent: globalController.getData().getCurrentWeather()
                      ),
                    ],
                  ),
              ),
        ),
      ),
    );
  }
}
