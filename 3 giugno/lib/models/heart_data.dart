//import 'package:flutter/material.dart';
//import 'dart:convert';

import 'package:intl/intl.dart'; //utility fuction 
//model for sleep data from data we get from server

class HeartData {
   
  final DateTime time;
  final int value;

  HeartData({required this.time, required this.value});
  
  HeartData.fromJson(String date, Map<String, dynamic> json) :
      time = DateFormat('yyyy-MM-dd HH:mm:ss').parse('$date ${json["time"]}'),
      value = (json["value"]);

  @override
  String toString() {
    return 'HR(time: $time, value: $value)'; 
  }//toString
}//HR_rest