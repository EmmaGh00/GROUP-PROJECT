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
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(
                  height: 50,
                ),

                // HR REST DATA
                Consumer<DataProvider>(builder: (context, data, child) {
                  if (data.restData.length == 0){
                    return Text('No HR rest data to display');
                  } else {
                    return RestDataPlot(restData: data.restData);
                  }
                }),
                

                ElevatedButton.icon(
                      icon: Icon(
                        Icons.favorite_outline,
                        color:Colors.blue, 
                        size: 50.0,
                      ),
                      label: Text('Fetch HR rest data',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        )
                      ),                
                  onPressed: (){
                    Provider.of<DataProvider>(context, listen: false).fetchRestData('2023-05-16');
                    //HR_rest = ...
                  },
                ),

                SizedBox(
                  height: 150,
                ),

                // SLEEP DATA
                Consumer<DataProvider>(builder: (context, data, child) {
                  if (data.sleepData.length == 0){
                    return Text('No sleep data to display');
                  } else {
                    return SleepDataPlot(sleepData: data.sleepData);
                  }
                }),
                

                ElevatedButton.icon(
                      icon: Icon(
                        Icons.hotel_outlined,
                        color:Colors.blue, 
                        size: 50.0,
                      ),
                      label: Text('Fetch Sleep data',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        )
                      ),                
                  onPressed: (){
                    Provider.of<DataProvider>(context, listen: false).fetchSleepData('2023-05-16');
                    //HR_rest = ...
                  },
                ),

                
                SizedBox(
                  height: 150,
                ),

                // HR DATA
                Consumer<DataProvider>(builder: (context, data, child) {
                  if (data.heartData.length == 0){
                    return Text('No HR data to display');
                  } else {
                    return HRDataPlot(heartData: data.heartData);
                  }
                }),


                ElevatedButton.icon(
                      icon: Icon(
                        Icons.monitor_heart_outlined,
                        color:Colors.blue, 
                        size: 50.0,
                      ),
                      label: Text('Fetch HR data',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        )
                      ),                
                  onPressed: (){
                    Provider.of<DataProvider>(context, listen: false).fetchHeartRateData('2023-05-16');
                    //HR_rest = ...
                  },
                ),

              ], 
            )
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