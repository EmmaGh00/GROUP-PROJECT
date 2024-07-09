//import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; //utility fuction 
//model for sleep data from data we get from server


class SleepData{
  final DateTime dateOfSleep;
  final int minutesAsleep;

  SleepData({required this.dateOfSleep, required this.minutesAsleep});

// saving data looking the documentation
  SleepData.fromJson(String date, int value) :
      dateOfSleep = DateFormat('yyyy-MM-dd').parse('$date'),
      minutesAsleep = value;

  @override //method useful to print an object
  String toString() {
    return 'SleepData(date: $dateOfSleep, timeOfSleep: $minutesAsleep)';
  }//toString
}//Steps