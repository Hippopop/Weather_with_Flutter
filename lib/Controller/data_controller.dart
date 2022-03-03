import 'package:flutter/cupertino.dart';

class Data with ChangeNotifier {
  factory Data() => _shared;
  Data._sharedInstance();
  static final Data _shared = Data._sharedInstance();

  String latitude = "22.3657094";
  String longitude = "91.808105";
  Unit unit = Unit.metric;
  String currentLocation = "Chattogram, Bangladesh";
  bool reload = true;
}

enum Unit { metric, imperial, standard }
