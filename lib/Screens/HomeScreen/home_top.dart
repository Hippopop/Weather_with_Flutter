import 'package:a_proper_weather_app/Const/constants.dart';
import 'package:a_proper_weather_app/Const/custom_icons_icons.dart';
import 'package:a_proper_weather_app/Models/Source%20Data%20Model/home_today_model.dart';
import 'package:flutter/material.dart';

class HomeTop extends StatelessWidget {
  HomeTop({
    Key? key,
    required this.needed,
  }) : super(key: key);
  HomeTopPortion needed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(
          flex: 2,
        ),
        Expanded(
          flex: 8,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Spacer(
                      flex: 4,
                    ),
                    Expanded(
                      flex: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              padding:
                                  const EdgeInsets.only(top: 10, right: 12),
                              alignment: Alignment.topRight,
                              //color: Colors.grey,
                              child: Icon(
                                CustomIcons.hail_inv,
                                color: Colors.blue,
                                size: 36,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    child: Text(
                                      'Today',
                                      style: focusText,
                                    ),
                                  ),
                                  Text(
                                    needed.day,
                                    //"${instance.sortedDate}",
                                    style: subText,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 40,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        //color: accentColor,
                        alignment: Alignment.center,
                        child: FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${needed.current_temp}",
                                style: focusText.copyWith(
                                  fontSize: 100,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2,
                                ),
                              ),
                              Text(
                                '\u00B0C',
                                style: subText.copyWith(
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 14,
                      child: Text(
                        needed.location,
                        style: subText,
                      ),
                    ),
                    Expanded(
                      flex: 12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Feels like ${needed.feels_like}\u00B0',
                            style: subText,
                          ),
                          const Text(
                            '.',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: textColor),
                          ),
                          Text(
                            'Sunset ${needed.sunsetTime}',
                            style: subText,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
