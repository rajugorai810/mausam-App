import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weatherapp_starter_project/utils/custom_color.dart';

import '../models/weather_data_current.dart';

class ConfortLevel extends StatelessWidget {

  final WeatherDataCurrent weatherDataCurrent;
  const ConfortLevel({Key? key, required this.weatherDataCurrent}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 1, left: 20, right: 20,bottom: 20),
          child: const Text("Comfort Level",
          style: TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(
          height: 180,
          child: Column(children: [
            Center(
              child: SleekCircularSlider(
                min: 0,
                max: 100,
                initialValue: weatherDataCurrent.current.humidity!.toDouble(),
                appearance: CircularSliderAppearance(
                  customWidths: CustomSliderWidths(
                    handlerSize: 0, trackWidth: 12, progressBarWidth: 12
                  ),
                  infoProperties: InfoProperties(
                    bottomLabelText: "Humidity",
                    bottomLabelStyle: TextStyle(letterSpacing: 0.1, fontSize: 14,height: 1.5)
                  ),
                  animationEnabled: true,
                  size: 140,
                  customColors: CustomSliderColors(
                    hideShadow: true,
                    trackColor: CustomColors.firstGradientColor.withAlpha(100),
                    progressBarColors: [CustomColors.firstGradientColor, CustomColors.secondGradientColor]
                  )
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(text: TextSpan(children: [
                  TextSpan(
                    text: "Feels Like", style: TextStyle(fontSize: 14, height: 0.8,color: CustomColors.textColorBlack, fontWeight: FontWeight.w400)
                  )
                ])),
                SizedBox(width: 5,),
                RichText(text: TextSpan(children: [
                  TextSpan(
                    text: "${weatherDataCurrent.current.feels_like}", style: TextStyle(fontSize: 14, height: 0.8,color: CustomColors.textColorBlack, fontWeight: FontWeight.w400)
                  )
                ])),
                Container(
                  height: 25,
                  margin: EdgeInsets.only(left: 40, right: 40),
                  width: 1,
                  color: CustomColors.dividerLine,
                ),
                RichText(text: TextSpan(children: [
                  TextSpan(
                    text: "UV Index", style: TextStyle(fontSize: 14, height: 0.8,color: CustomColors.textColorBlack, fontWeight: FontWeight.w400)
                  )
                ])),
                SizedBox(width: 5,),
                RichText(text: TextSpan(children: [
                  TextSpan(
                    text: "${weatherDataCurrent.current.uvIndex}", style: TextStyle(fontSize: 14, height: 0.8,color: CustomColors.textColorBlack, fontWeight: FontWeight.w400)
                  )
                ])),

              ],
            )
          ]),
        )
      ],
    );
  }
}