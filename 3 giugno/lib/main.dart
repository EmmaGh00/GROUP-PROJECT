import 'package:flutter/material.dart';
import 'package:project_test1/models/quiz.dart';
import 'package:project_test1/models/score.dart';
import 'package:project_test1/models/sus.dart';
import 'package:project_test1/models/today.dart';
import 'package:provider/provider.dart';

import 'package:project_test1/provider/data_provider.dart';
import 'package:project_test1/screens/loginPage.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ScoreModel()),
        ChangeNotifierProvider(create: (context) => TodayModel()),
        ChangeNotifierProvider(create: (context) => QuizModel()),
        ChangeNotifierProvider(create: (context) => SusModel())
      ],
      child: const MyApp()
    ),
  );
} //main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => DataProvider(),
        child: MaterialApp(
      //debugShowCheckedModeBanner: false,
      //CREARE TEMA
      home: LoginPage())
    );
  } //build
}//MyApp