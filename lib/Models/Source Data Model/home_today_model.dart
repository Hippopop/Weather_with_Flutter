import 'package:a_proper_weather_app/Controller/data_controller.dart';
import 'package:a_proper_weather_app/Models/main_weather_model.dart';
import 'package:a_proper_weather_app/Models/time_formatting_model.dart';
import 'package:flutter/foundation.dart';

class HomeTopPortion {
  Data data = Data();
  late String unit;
  var current_temp;
  var feels_like;
  String location = 'loading..';
  String day = TimeFormatter(unformatted: DateTime.now()).sortedDate!;
  String sunriseTime = "00:00 ?";
  String sunsetTime = "00:00 ?";
  String icon = "02d";
  Current? model;
  HomeTopPortion({this.model}) {
    if (model != null) {
      sunriseTime = TimeFormatter.fromUnix(model!.sunrise).sortedTime!;
      sunsetTime = TimeFormatter.fromUnix(model!.sunset).sortedTime!;
      day = TimeFormatter.fromUnix(model!.dt).sortedDate!;
      current_temp = model!.temp;
      feels_like = model!.feelsLike;
      icon = model!.weather.icon;
      location = data.currentLocation;
      unit = data.unit.name;
    } else {
      if (kDebugMode) {
        print("caught error: HomeTopPortion received a null model");
      }
      current_temp = "00";
      feels_like = "00";
      location = data.currentLocation;
      unit = data.unit.name;
    }
  }
}
