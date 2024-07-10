import 'package:flutter/material.dart';
import 'package:project_test1/widgets/plot_HR.dart';
import 'package:project_test1/widgets/plot_Sleep.dart';
import 'package:provider/provider.dart';

import 'package:project_test1/screens/homePage.dart';
import 'package:project_test1/provider/data_provider.dart';
import 'package:project_test1/widgets/plot_HR_rest.dart';


class Monitoring extends StatefulWidget {
  
  @override
  _MonitoringPageState createState() => _MonitoringPageState();
}

class _MonitoringPageState extends State<Monitoring> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Real Time Value',
            style: TextStyle(
              fontFamily: 'Outfit',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
              color: Colors.blue,
              fontSize: 30,
              letterSpacing: 0,
            ),
          ),
          centerTitle: true,
          elevation: 2,
        //title: Text('Calendario'),
          leading: IconButton(
            onPressed: ()
              => _toHomePage(context), icon: Icon(Icons.arrow_back)
          )
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // DA DEFINIRE CON SHARED PREFERENCES di HR_rest, sleep, HR_mean
            // con dentro il valore di quel giorno
            // da usare poi nella pagina today

            // HR REST DATA
            Consumer<DataProvider>(builder: (context, data, child) {
              if (data.restData.length == 0){
                return Text('No HR rest data to display');
              } else {
                return RestDataPlot(restData: data.restData);
              }
            }),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: (){
                Provider.of<DataProvider>(context, listen: false).fetchRestData('2023-05-16');
                //HR_rest = ...
              }, 
              child: Text('Fetch HR rest data')
            ),

            // SLEEP DATA
            Consumer<DataProvider>(builder: (context, data, child) {
              if (data.sleepData.length == 0){
                return Text('No sleep data to display');
              } else {
                return SleepDataPlot(sleepData: data.sleepData);
              }
            }),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: (){
                Provider.of<DataProvider>(context, listen: false).fetchSleepData('2023-05-16');
                //sleep = ...
              }, 
              child: Text('Fetch sleep data')
            ),

            // HR DATA
            Consumer<DataProvider>(builder: (context, data, child) {
              if (data.sleepData.length == 0){
                return Text('No HR data to display');
              } else {
                return HRDataPlot(heartData: data.heartData);
              }
            }),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: (){
                Provider.of<DataProvider>(context, listen: false).fetchHeartRateData('2023-05-16');
                //HR_mean = media(HR...)
              }, 
              child: Text('Fetch HR data')
            ),


          ], 
        )
      ),
    );
  }

// NAVIGATE - toHomePage
  void _toHomePage(BuildContext context){
    //Pop the drawer first 
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
  }//_toCalendarPage
}