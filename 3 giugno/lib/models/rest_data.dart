//import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; //utility fuction 
//model for sleep data from data we get from server

class Restdata {
  final DateTime time;
  final double value;

  Restdata({required this.time, required this.value});

  Restdata.fromJson(String date, Map<String, dynamic> json) : //is a costroctor with a name, 
      time = DateFormat('yyyy-MM-dd HH:mm:ss').parse('$date ${json["time"]}'),
      value = double.parse('${json["value"]}');  

  @override
  String toString() {
    return 'HR_rest(time: $time, value: $value)'; 
  }//toString
}//HR_rest