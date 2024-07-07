import 'package:flutter/material.dart';
import 'package:project_test1/models/score.dart';
import 'package:provider/provider.dart';

import 'package:project_test1/provider/data_provider.dart';
import 'package:project_test1/screens/loginPage.dart';


void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => ScoreModel(),
    child: const MyApp()),
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
      home: LoginPage())
    );
  } //build
}//MyApp