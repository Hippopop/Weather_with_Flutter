import 'package:a_proper_weather_app/Controller/data_controller.dart';
import 'package:a_proper_weather_app/Models/main_weather_model.dart';
import 'package:a_proper_weather_app/Models/time_formatting_model.dart';
import 'package:flutter/foundation.dart';

class PillModel {
  Data data = Data();
  String unit = "";
  String hour = "00:00";
  String icon = "empty";
  var temp;
  Current? current;
  PillModel({this.current}) {
    if (current != null) {
      hour = TimeFormatter.fromUnix(current!.dt).hour!;
      temp = current?.temp;
      icon = current!.weather.icon;
      unit = data.unit.name;
    } else {
      if (kDebugMode) {
        print("caught error: HourlyPillModel received a null model");
      }
      temp = "00";
      unit = data.unit.name;
    }
  }
}
