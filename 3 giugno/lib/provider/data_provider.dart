import 'package:flutter/material.dart';
import 'package:project_test1/models/rest_data.dart';
import 'package:project_test1/services/impact.dart';

class DataProvider extends ChangeNotifier {

  //This serves as database of the application
  List<Restdata> restData = [];

  //Method to fetch step data from the server
  void fetchRestData(String day) async {

    //Get the response
    final data = await ImpactService.fetchRestData(day);

    //if OK parse the response adding all the elements to the list, otherwise do nothing
    if (data != null) {
      //for (var i = 0; i < data['data']('data').length; i++) {
        restData.add(
           Restdata.fromJson(data['data']['date'], data['data']['data']['value']));
      //} //for

      //remember to notify the listeners
      notifyListeners();
    }//if

  }//fetchRestData

  //Method to clear the "memory"
  void clearData() {
    restData.clear();
    notifyListeners();
  }//clearData
  
}//DataProvider