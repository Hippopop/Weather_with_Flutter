import 'package:a_proper_weather_app/Models/Source%20Data%20Model/home_today_model.dart';
import 'package:a_proper_weather_app/Models/Source%20Data%20Model/hourly_pill_model.dart';
import 'package:a_proper_weather_app/Models/main_weather_model.dart';
import 'package:flutter/foundation.dart';

class MainDataModel {
  MainWeatherModel? mainModel;
  late HomeTopPortion homeTopPortion;
  List<PillModel> pillModelList = [];

  MainDataModel({this.mainModel}) {
    if (mainModel != null) {
      homeTopPortion = HomeTopPortion(model: mainModel!.current);
      for (final hour in mainModel!.hourly) {
        pillModelList.add(PillModel(current: hour));
      }
    } else {
      if (kDebugMode) {
        print("caught error: MainDataModel received a null model");
      }
      for (int i = 0; i < 24; i++) {
        pillModelList.add(PillModel());
      }
      homeTopPortion = HomeTopPortion();
    }
  }
}
