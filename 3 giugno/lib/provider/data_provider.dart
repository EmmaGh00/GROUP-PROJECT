import 'package:flutter/material.dart';
import 'package:project_test1/models/heart_data.dart';
import 'package:project_test1/models/rest_data.dart';
import 'package:project_test1/models/sleep_data.dart';
import 'package:project_test1/services/impact.dart';

class DataProvider extends ChangeNotifier {

  //This serves as database of the application
  List<Restdata> restData = [];
  List<SleepData> sleepData = [];
  List<HeartData> heartData= [];

  //Method to fetch step data from the server
  void fetchRestData(String day) async {
    //Get the response
    final data = await ImpactService.fetchRestData(day);

    //if OK parse the response adding all the elements to the list, otherwise do nothing
    if (data != null) {
        restData.add(
           Restdata.fromJson(data['data']['date'], data['data']['data']['value'])
        );
      //remember to notify the listeners
      notifyListeners();
    }//if
  }//fetchRestData


  //Method to fetch step data from the server
  void fetchSleepData(String day) async {

    //Get the response
    final data = await ImpactService.fetchSleepData(day);

    //if OK parse the response adding all the elements to the list, otherwise do nothing
    if (data != null) {
        sleepData.add(
            SleepData.fromJson(data['data']['date'], data['data']['data']['minutesAsleep'])
        );
      }

      //remember to notify the listeners
      notifyListeners();
    }//if

  //fetchStepData


  //Method to fetch step data from the server
  void fetchHeartRateData(String day) async {

    //Get the response
    final data = await ImpactService.fetchHeartRateData(day);

    //if OK parse the response adding all the elements to the list, otherwise do nothing
    if (data != null) {
      for (var i = 0; i < data['data']['data'].length; i++) {
        heartData.add(
            HeartData.fromJson(data['data']['date'], data['data']['data'][i]));
      } //for

      //remember to notify the listeners
      notifyListeners();
    }//if
  }//fetchStepData

  //Method to clear the "memory"
  void clearData() {
    restData.clear();
    sleepData.clear();
    notifyListeners();
  }//clearData
  
}//DataProvider
