class MainWeatherModel {
  MainWeatherModel({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.hourly,
    required this.daily,
  });

  var lat;
  var lon;
  final String timezone;
  var timezoneOffset;
  final Current current;
  final List<Current> hourly;
  final List<Daily> daily;

  factory MainWeatherModel.fromMap(Map<String, dynamic> json) {
    return MainWeatherModel(
      lat: json["lat"],
      lon: json["lon"],
      timezone: json["timezone"] as String,
      timezoneOffset: json["timezone_offset"],
      current: Current.fromMap(json["current"] as Map<String, dynamic>),
      hourly: List<Current>.from(
        (json["hourly"] as Iterable<dynamic>).map(
          (x) => Current.fromMap(x as Map<String, dynamic>),
        ),
      ),
      daily: List<Daily>.from(
        (json["daily"] as Iterable<dynamic>).map(
          (x) => Daily.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}

class Current {
  Current({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.pop,
    this.rain,
  });

  int dt;
  int sunrise;
  int sunset;
  var temp;
  var feelsLike;
  var pressure;
  var humidity;
  var dewPoint;
  var uvi;
  var clouds;
  var visibility;
  var windSpeed;
  var windDeg;
  var windGust;
  final Weather weather;
  var pop;
  final Rain? rain;

  factory Current.fromMap(Map<String, dynamic> json) {
    final List weather = json["weather"] as List;
    return Current(
      dt: (json["dt"] == null) ? 0 : json["dt"] as int,
      sunrise: (json["sunrise"] == null) ? 0 : json["sunrise"] as int,
      sunset: (json["sunset"] == null) ? 0 : json["sunset"] as int,
      temp: json["temp"],
      feelsLike: json["feels_like"],
      pressure: json["pressure"],
      humidity: json["humidity"],
      dewPoint: json["dew_point"],
      uvi: json["uvi"],
      clouds: json["clouds"],
      visibility: json["visibility"],
      windSpeed: json["wind_speed"],
      windDeg: json["wind_deg"],
      windGust: json["wind_gust"],
      weather: Weather.fromMap(weather[0] as Map<String, dynamic>),
      pop: json["pop"],
      rain: json["rain"] == null
          ? null
          : Rain.fromMap(json["rain"] as Map<String, dynamic>),
    );
  }
}

class Rain {
  Rain({
    required this.the1H,
  });

  var the1H;

  factory Rain.fromMap(Map<String, dynamic> json) => Rain(
        the1H: json["1h"],
      );
}

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  var id;
  final String? main;
  final String? description;
  final String icon;

  factory Weather.fromMap(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"] as String,
        description: json["description"] as String,
        icon: json["icon"] as String,
      );
}

class Daily {
  Daily({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.uvi,
    required this.rain,
  });

  int dt;
  var sunrise;
  var sunset;
  var moonrise;
  var moonset;
  var moonPhase;
  final Temp temp;
  final FeelsLike feelsLike;
  var pressure;
  var humidity;
  var dewPoint;
  var windSpeed;
  var windDeg;
  var windGust;
  final List<Weather> weather;
  var clouds;
  var pop;
  var uvi;
  var rain;

  factory Daily.fromMap(Map<String, dynamic> json) => Daily(
        dt: json["dt"] as int,
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        moonrise: json["moonrise"],
        moonset: json["moonset"],
        moonPhase: json["moon_phase"],
        temp: Temp.fromMap(json["temp"] as Map<String, dynamic>),
        feelsLike:
            FeelsLike.fromMap(json["feels_like"] as Map<String, dynamic>),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"],
        windSpeed: json["wind_speed"],
        windDeg: json["wind_deg"],
        windGust: json["wind_gust"],
        weather: List<Weather>.from(
          (json["weather"] as Iterable<dynamic>).map(
            (x) => Weather.fromMap(x as Map<String, dynamic>),
          ),
        ),
        clouds: json["clouds"],
        pop: json["pop"],
        uvi: json["uvi"],
        rain: json["rain"],
      );
}

class FeelsLike {
  FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  var day;
  var night;
  var eve;
  var morn;

  factory FeelsLike.fromMap(Map<String, dynamic> json) => FeelsLike(
        day: json["day"],
        night: json["night"],
        eve: json["eve"],
        morn: json["morn"],
      );
}

class Temp {
  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  var day;
  var min;
  var max;
  var night;
  var eve;
  var morn;

  factory Temp.fromMap(Map<String, dynamic> json) => Temp(
        day: json["day"],
        min: json["min"],
        max: json["max"],
        night: json["night"],
        eve: json["eve"],
        morn: json["morn"],
      );
}
/*

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    return reverseMap ??= map.map((k, v) => MapEntry(v, k));
  }
}
*/
