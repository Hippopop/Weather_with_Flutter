import 'package:a_proper_weather_app/Const/constants.dart';
import 'package:a_proper_weather_app/Const/custom_icons_icons.dart';
import 'package:a_proper_weather_app/Models/main_weather_model.dart';
import 'package:a_proper_weather_app/Models/time_formatting_model.dart';
import 'package:flutter/material.dart';

class HourlyPillInactive extends StatelessWidget {
  HourlyPillInactive({
    Key? key,
    required this.screen,
    required this.hour,
  }) : super(key: key);

  final Size screen;
  final Current hour;
  @override
  Widget build(BuildContext context) {
    final String x = hour.temp as String;
    return Container(
      width: screen.width / 5,
      height: double.infinity,
      margin: EdgeInsets.only(top: 20, left: 5, right: 5),
      padding: EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
        color: accentColor,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: overlayColor.withAlpha(100),
        ),
      ),
      child: Column(
        children: [
          Expanded(
              child: Center(
            child: FittedBox(
              child: Text(
                "${TimeFormatter.fromUnix(hour.dt).hour}",
                style: subText,
              ),
            ),
          )),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(1),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              //color: overlayColor,
            ),
            child: Icon(
              CustomIcons.sun,
              color: textColor,
            ),
          )),
          Expanded(
            child: Center(
              child: Text.rich(TextSpan(
                  text: x.substring(0, x.indexOf(".")),
                  style: subtitle,
                  children: [
                    TextSpan(
                      text: '\u00B0C',
                      style: subText,
                    )
                  ])),
            ),
          ),
        ],
      ),
    );
  }
}
