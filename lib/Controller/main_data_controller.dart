import 'dart:convert';

import 'package:a_proper_weather_app/Const/apiKey.dart';
import 'package:a_proper_weather_app/Controller/data_controller.dart';
import 'package:a_proper_weather_app/Models/Source%20Data%20Model/main_data_model.dart';
import 'package:a_proper_weather_app/Models/main_weather_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class MainDataController {
  Data neededData = Data();
  Future<MainWeatherModel?> modelSetter() async {
    try {
      final String url =
          //
          //    '';
          'https://api.openweathermap.org/data/2.5/onecall?lat=${neededData.latitude}&lon=${neededData.latitude}&units=${neededData.unit.name}&exclude=minutely&appid=$apiKey';

      final http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedJson =
            json.decode(response.body) as Map<String, dynamic>;
        final MainWeatherModel model = MainWeatherModel.fromMap(decodedJson);
        print(model.current.weather.icon);
        return model;
      } else {
        if (kDebugMode) {
          print("weather model faced network error!");
        }
        return null;
      }
    } catch (error) {
      if (kDebugMode) {
        print("caught error: $error");
      }
      return null;
    }
  }

  Stream<MainDataModel> dataStreamer() async* {
    while (true) {
      await Future.delayed(Duration(seconds: (neededData.reload) ? 0 : 3));
      final MainWeatherModel? model = await modelSetter();
      if (kDebugMode) {
        print("lat: ${neededData.latitude}, lon: ${neededData.longitude}");
      }
      neededData.reload = false;
      yield MainDataModel(mainModel: model);
    }
  }

  ///
  ///
  ///
  /// Needs to be moved
// Stream<String?> currentDay() async* {
//   while (true) {
//     await Future.delayed(const Duration(seconds: 3));
//     final TimeFormatter format = TimeFormatter(unformatted: DateTime.now());
//     yield format.sortedDate;
//   }
// }
}
