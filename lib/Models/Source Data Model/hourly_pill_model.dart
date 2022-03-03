import 'package:a_proper_weather_app/Models/main_weather_model.dart';
import 'package:a_proper_weather_app/Models/time_formatting_model.dart';

class PillModel {
  String unit;
  String hour = "00:00";
  var temp;
  Current? data;
  PillModel({this.data, required this.unit}) {
    if (data != null) {
      hour = TimeFormatter.fromUnix(data!.dt).hour!;
      temp = data?.temp;
    } else {
      temp = "00";
    }
  }
}
