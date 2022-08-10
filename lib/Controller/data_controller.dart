import 'package:a_proper_weather_app/Const/custom_icons_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class Data with ChangeNotifier {
  factory Data() => _shared;
  Data._sharedInstance();
  static final Data _shared = Data._sharedInstance();

  String latitude = "22.3657094";
  String longitude = "91.808105";
  Unit unit = Unit.metric;
  String currentLocation = "Chattogram, Bangladesh";
  bool reload = false;

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
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    } else {
      final Position found = await Geolocator.getCurrentPosition();
      latitude = "${found.latitude}";
      longitude = "${found.longitude}";
      final List<Placemark> place = await placemarkFromCoordinates(
          double.parse(latitude), double.parse(longitude));
      currentLocation = "${place[0].locality}, ${place[0].country}";
      if (kDebugMode) {
        print(
          "from position : $latitude and $longitude",
        );
      }
      return found;
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

enum Unit { metric, imperial, standard }
Map<String, Icon> icon = {
  '01d': const Icon(
    CustomIcons.sun,
    color: Colors.amber,
    size: 36,
  ),
  '02d': const Icon(
    CustomIcons.cloud_sun_inv,
    color: Colors.blue,
    size: 36,
  ),
  '03d': const Icon(
    CustomIcons.cloud_inv,
    color: Colors.blue,
    size: 36,
  ),
  '04d': const Icon(
    CustomIcons.clouds_inv,
    color: Colors.blue,
    size: 36,
  ),
  '09d': const Icon(
    CustomIcons.hail_inv,
    color: Colors.blue,
    size: 36,
  ),
  '10d': const Icon(
    CustomIcons.rain,
    color: Colors.blue,
    size: 36,
  ),
  '11d': const Icon(
    CustomIcons.clouds_flash_alt,
    color: Colors.blue,
    size: 36,
  ),
  '13d': const Icon(
    CustomIcons.snow_heavy,
    color: Colors.blue,
    size: 36,
  ),
  '50d': const Icon(
    CustomIcons.fog_sun,
    color: Colors.blue,
    size: 36,
  ),
  '01n': const Icon(
    CustomIcons.moon_inv,
    color: Colors.blue,
    size: 36,
  ),
  '02n': const Icon(
    CustomIcons.cloud_moon_inv,
    color: Colors.blue,
    size: 36,
  ),
  '03n': const Icon(
    CustomIcons.cloud_inv,
    color: Colors.blue,
    size: 36,
  ),
  '04n': const Icon(
    CustomIcons.clouds_inv,
    color: Colors.blue,
    size: 36,
  ),
  '09n': const Icon(
    CustomIcons.hail_inv,
    color: Colors.blue,
    size: 36,
  ),
  '10n': const Icon(
    CustomIcons.rain,
    color: Colors.blue,
    size: 36,
  ),
  '11n': const Icon(
    CustomIcons.clouds_flash_alt,
    color: Colors.blue,
    size: 36,
  ),
  '13n': const Icon(
    CustomIcons.snow_heavy,
    color: Colors.blue,
    size: 36,
  ),
  '50n': const Icon(
    CustomIcons.fog_moon,
    color: Colors.blue,
    size: 36,
  ),
  'empty': const Icon(
    CustomIcons.na,
    color: Colors.blue,
    size: 36,
  ),
};
enum Main {
  Thunderstorm,
  Drizzle,
  Rain,
  Snow,
  Mist,
  Smoke,
  Haze,
  Dust,
  Fog,
  Sand,
  Ash,
  Squall,
  Tomado,
  Clear
}
