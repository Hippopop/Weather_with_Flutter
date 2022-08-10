import 'package:a_proper_weather_app/Const/constants.dart';
import 'package:a_proper_weather_app/Controller/data_controller.dart';
import 'package:a_proper_weather_app/Models/Source%20Data%20Model/hourly_pill_model.dart';
import 'package:flutter/material.dart';

class HourlyPillActive extends StatefulWidget {
  const HourlyPillActive({
    Key? key,
    required this.screen,
    required this.model,
  }) : super(key: key);
  final Size screen;
  final PillModel model;

  @override
  State<HourlyPillActive> createState() => _HourlyPillActiveState();
}

class _HourlyPillActiveState extends State<HourlyPillActive> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      width: widget.screen.width / 5,
      height: double.infinity,
      margin: EdgeInsets.only(bottom: 20, left: 5, right: 5),
      padding: const EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
        color: textColor,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: overlayColor.withAlpha(100),
        ),
      ),
      child: Column(
        children: [
          Expanded(
              child: Center(
            child: Text(
              widget.model.hour,
              style: subText.copyWith(
                color: baseColor,
              ),
            ),
          )),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(1),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: overlayColor,
              ),
              child: icon[widget.model.icon],
            ),
          ),
          Expanded(
            child: Center(
              child: Text.rich(
                TextSpan(
                  text: "${widget.model.temp}",
                  style: subtitle.copyWith(color: baseColor),
                  children: [
                    TextSpan(
                      text: '\u00B0C',
                      style: subText.copyWith(
                        color: baseColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
