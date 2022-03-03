import 'dart:convert';

import 'package:a_proper_weather_app/Controller/data_controller.dart';
import 'package:a_proper_weather_app/Models/main_weather_model.dart';
import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../Models/time_formatting_model.dart';

class MainProviderClass with ChangeNotifier {
  MainWeatherModel? mainWeatherModel;
  Data neededData = Data();
  String? location;
  Future<void> modelSetter() async {
    try {
      String url =
          //'';
          'https://api.openweathermap.org/data/2.5/onecall?lat=${neededData.latitude}&lon=${neededData.latitude}&units=${neededData.unit.name}&exclude=minutely&appid=98020120367c4f6853e78032308972cd';

      final http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedJson =
            json.decode(response.body) as Map<String, dynamic>;
        final MainWeatherModel model = MainWeatherModel.fromMap(decodedJson);
        mainWeatherModel = model;
        notifyListeners();
      } else {
        if (kDebugMode) {
          print("Main model faced error!");
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print("caught error: $error");
      }
      //return null;
    }
    //return null;
  }

  Stream<MainWeatherModel?> weatherDataStream() async* {
    while (true) {
      await Future.delayed(Duration(seconds: (neededData.reload) ? 0 : 10));
      print("lat = ${neededData.latitude}");
      print("lon = ${neededData.longitude}");
      await modelSetter();
      neededData.reload = false;
      notifyListeners();
      yield mainWeatherModel;
    }
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    } else {
      final Position found = await Geolocator.getCurrentPosition();
      neededData.latitude = "${found.latitude}";
      neededData.longitude = "${found.longitude}";
      final List<Placemark> place = await placemarkFromCoordinates(
          double.parse(neededData.latitude),
          double.parse(neededData.longitude));
      location = "${place[0].locality}, ${place[0].country}";
      if (kDebugMode) {
        print(
            "from position : ${neededData.latitude} and ${neededData.longitude}");
      }
      return found;
    }
  }

  Stream<String?> currentDay() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 3));
      final TimeFormatter format = TimeFormatter(unformatted: DateTime.now());
      yield format.sortedDate;
    }
  }

  Future<void> setStringLocation() async {
    List<Location> locations =
        await locationFromAddress("chittagong, bangladesh");
    print("from adress:");
    print(locations);
    List<Placemark> placemarks = await placemarkFromCoordinates(
        locations[0].latitude, locations[0].longitude);
    print("from coord:");
    print(placemarks[0]);
  }
}
