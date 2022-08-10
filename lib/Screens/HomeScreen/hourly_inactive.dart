import 'package:a_proper_weather_app/Const/constants.dart';
import 'package:a_proper_weather_app/Controller/data_controller.dart';
import 'package:a_proper_weather_app/Models/Source%20Data%20Model/hourly_pill_model.dart';
import 'package:flutter/material.dart';

class HourlyPillInactive extends StatelessWidget {
  const HourlyPillInactive({
    Key? key,
    required this.screen,
    required this.hour,
  }) : super(key: key);

  final Size screen;
  final PillModel hour;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      width: screen.width / 5,
      height: double.infinity,
      margin: EdgeInsets.only(top: 20, left: 5, right: 5),
      padding: const EdgeInsets.symmetric(vertical: 3),
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
                hour.hour,
                style: subText,
              ),
            ),
          )),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(1),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: overlayColor.withAlpha(30),
            ),
            child: (icon[hour.icon]) /*!..color = Colors.white*/,
          )),
          Expanded(
            child: Center(
              child: Text.rich(
                  TextSpan(text: "${hour.temp}", style: subtitle, children: [
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
