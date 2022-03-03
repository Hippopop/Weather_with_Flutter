import 'package:a_proper_weather_app/Models/main_weather_model.dart';
import 'package:a_proper_weather_app/Models/time_formatting_model.dart';

class HomeTopPortion {
  String unit;
  var current_temp;
  var feels_like;
  String location = 'Unknown';
  String day = TimeFormatter(unformatted: DateTime.now()).sortedDate!;
  String sunriseTime = "00:00 ?";
  String sunsetTime = "00:00 ?";
  MainWeatherModel? model;
  HomeTopPortion({this.model, required this.unit}) {
    if (model != null) {
      sunriseTime = TimeFormatter.fromUnix(model!.current.sunrise).sortedTime!;
      sunsetTime = TimeFormatter.fromUnix(model!.current.sunset).sortedTime!;
      day = TimeFormatter.fromUnix(model!.current.dt).sortedDate!;
      current_temp = model!.current.temp;
      feels_like = model!.current.feelsLike;
    } else {
      current_temp = "00";
      feels_like = "00";
    }
  }
}
