import 'package:a_proper_weather_app/Const/constants.dart';
import 'package:a_proper_weather_app/Const/custom_icons_icons.dart';
import 'package:a_proper_weather_app/Models/Source%20Data%20Model/home_today_model.dart';
import 'package:a_proper_weather_app/Models/Source%20Data%20Model/hourly_pill_model.dart';
import 'package:a_proper_weather_app/Models/main_weather_model.dart';
import 'package:a_proper_weather_app/Provider/parsing_function.dart';
import 'package:a_proper_weather_app/Screens/HomeScreen/home_top.dart';
import 'package:flutter/material.dart';

import 'chance_of_rain.dart';
import 'hourly_active.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    MainProviderClass prov = MainProviderClass();
    final screen = MediaQuery.of(context).size;
    return StreamBuilder<MainWeatherModel?>(
      stream: prov.weatherDataStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return Scaffold(
            backgroundColor: baseColor,
            drawer: const Drawer(),
            appBar: AppBar(
              leading: const Icon(Icons.sort_rounded),
              centerTitle: true,
              backgroundColor: baseColor,
              elevation: 0,
              title: Text(
                'Weather forecast',
                style: title,
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4.0,
                    vertical: 4,
                  ),
                  child: IconButton(
                    onPressed: () async {
                      final x = await prov.determinePosition();
                    },
                    icon: const Icon(Icons.location_on_rounded),
                  ),
                )
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: HomeTop(
                    needed:
                        HomeTopPortion(model: snapshot.data, unit: "matric"),
                  ),
                ),

                ///Day changing panel
                Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 15,
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              right: 8.0,
                              top: 5.0,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        FittedBox(
                                          child: Text(
                                            'Today',
                                            style: subtitle,
                                          ),
                                        ),
                                        Container(
                                          height: 4,
                                          width: 4,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: textColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        FittedBox(
                                          child: Text(
                                            'Tomorrow',
                                            style: subtitle,
                                          ),
                                        ),
                                        // Container(
                                        //   height: 4,
                                        //   width: 4,
                                        //   decoration: BoxDecoration(
                                        //     shape: BoxShape.circle,
                                        //     color: textColor,
                                        //   ),
                                        // )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: FittedBox(
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'Next 7 days ',
                                                style: subtitle.copyWith(
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              const Icon(
                                                CustomIcons.angle_double_right,
                                                color: Colors.blue,
                                                size: 18,
                                              )
                                            ],
                                          ),
                                          Container(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 40,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              // HourlyPillInactive(
                              //   screen: screen,
                              //   hour: snapshot.data!.hourly[5],
                              // ),
                              HourlyPillActive(
                                screen: screen,
                                model: PillModel(
                                    unit: "matric",
                                    data: snapshot.data?.hourly[0]),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      Expanded(
                        flex: 43,
                        child: ChanceOfRain(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
