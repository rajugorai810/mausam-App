
import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/models/weather_data_current.dart';

import '../utils/custom_color.dart';

class CurrentWeatherWidget extends StatelessWidget {

final WeatherDataCurrent weatherDataCurrent;

  const CurrentWeatherWidget({Key? key, required this.weatherDataCurrent}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // temperature area
        temperatureAreaWidget(),
        SizedBox(height: 20,),
        //more details --> windspeed, humidity , clouds
        currentWeatherMoreDetailsWidget(),
      ],
    );
  }

  Widget temperatureAreaWidget(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
      Image.asset(
        "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
        height: 80,
        width: 80,
      ),
      Container(
        height: 50,
        width: 1,
        color: CustomColors.dividerLine,
      ),
      Column(
        children: [
          Text("${weatherDataCurrent.current.temp}°",style: TextStyle(color: CustomColors.textColorBlack, fontSize: 50, fontWeight: FontWeight.w700),),
          Text("${weatherDataCurrent.current.weather![0].description}")
        ],
      )
    ],);
  }

  // RichText(text: TextSpan(
  //       children: [
  //         TextSpan(text: "${weatherDataCurrent.current.temp}°", style: TextStyle(color: CustomColors.textColorBlack, fontSize: 60, fontWeight: FontWeight.w600)),
  //         TextSpan(text: "${weatherDataCurrent.current.weather![0].description}", style: TextStyle(color: CustomColors.textColorBlack, fontSize: 15, fontWeight: FontWeight.w400)),
  //       ]
  //     ),
  //     ),

  Widget currentWeatherMoreDetailsWidget(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color:  CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset("assets/icons/windspeed.png"),
            ),
            Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color:  CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset("assets/icons/clouds.png"),
            ),
            Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color:  CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset("assets/icons/humidity.png"),
            ),
          ],
        ),

        SizedBox(height: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 20,
            width: 65,
            child: Text("${weatherDataCurrent.current.windSpeed} km/h",
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
            width: 65,
            child: Text("${weatherDataCurrent.current.clouds} %",
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
            width: 65,
            child: Text("${weatherDataCurrent.current.humidity} %",
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
            ),
          ),
        ],
      )
      
      ],
    );
  }
}