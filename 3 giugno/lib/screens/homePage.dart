import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:project_test1/screens/calendarPage.dart';
import 'package:project_test1/screens/emergencyPage.dart';
import 'package:project_test1/screens/loginPage.dart';
import 'package:project_test1/screens/monitoringPage.dart';
import 'package:project_test1/screens/profilePage.dart';
import 'package:project_test1/screens/privacyPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routename = 'Homepage';

  @override
  Widget build(BuildContext context) {
    print('${HomePage.routename} built');
    return Scaffold(
      appBar: AppBar(
        //title: Text(HomePage.routename,
        title: Text('Hello, Giacomo!',
          style: TextStyle(
            fontFamily: 'Outfit',
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            fontSize: 30,
            letterSpacing: 0,
          ),
        ),
      ),
      body: Center(
        child:Container(
          height: 200,
          width: 350,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children:[
              // PRIMA RIGA
              Expanded(
                child: Row(
                  children: [
                   //MONITORING 
                   ElevatedButton.icon(
                      icon: Icon(
                        Icons.monitor_heart_outlined, 
                        color:Colors.blue, 
                        size:50.0,
                      ),
                      label: Text('Monitoring',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder:(context) => Monitoring()));
                      },
                    ),
                    //CALENDAR
                    ElevatedButton.icon(
                      icon: Icon(
                        Icons.calendar_month, 
                        color:Colors.blue,
                        size:50.0,
                      ),
                      label: Text('Calendar',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        )
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder:(context) => Calendar()));
                      },
                    ),
                  ], //children                 
                ),
              ),

              // FRASE: YOU CAN DO IT
              Expanded(
                child: Text('YOU CAN DO IT!',
                  style: TextStyle(
                    fontSize: 40,
                    foreground: Paint()
                      ..shader = ui.Gradient.linear(
                        const Offset(0, 20),
                        const Offset(250, 20),
                        <Color> [
                          Color.fromARGB(255, 33, 40, 243).withOpacity(0.5),
                          Color.fromARGB(255, 3, 191, 248).withOpacity(0.5),
                        ]
                      )
                  ),
                )
              ),

              // SECONDA RIGA
              Expanded(
                child: Row(
                  children: [
                    //MY DIARY
                    ElevatedButton.icon(
                      icon: Icon(
                        Icons.draw, 
                        color:Colors.blue, 
                        size:50.0,
                      ),
                      label: Text('My Diary',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {},
                    ),
                    //EMERGENCY
                    ElevatedButton.icon(
                      icon: Icon(
                        Icons.emergency_outlined, 
                        color:Colors.blue, 
                        size:50.0,
                      ),
                      label: Text('Emergency',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        )
                      ),
                      onPressed: () {
                        Navigator.push (context, MaterialPageRoute(builder:(context) => Emergency()));
                      },
                    ),
                  ],                  
                ),
              ),
            ], //children
          ),
        ),
      ),

      // DRAWER
      drawer: Drawer(
        elevation: 16,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
              ),
              child: Center(
                child: Text('My Safe Plan', 
                  style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize:20.0,
                    fontFamily: 'Arial', //font, vedi bene il paccheto google font
                    letterSpacing:0.5,
                  ),
                ),
              ),  
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.blue
              ),
              title: Text('Profile'),
              onTap: () => _toProfilePage(context),
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.blue
              ),
              title: Text('Logout'),
              onTap: () => _toLoginPage(context),
            ),
            ListTile(
              leading: Icon(
                Icons.star,
                color: Colors.blue
              ),
              title: Text('Awards'),
              onTap: () => _toLoginPage(context),
            ),
            ListTile(
              leading: Icon(
                Icons.key,
                color: Colors.blue
              ),
              title: Text('Privacy'),
              onTap: () => _toPrivacyPage(context),
            ),
          ],  // children
        ),
      ),
    );
  } //build

//NAVIGATION - toLoginPage
  void _toLoginPage(BuildContext context){
    //Pop the drawer first 
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }//_toLoginPage

//NAVIGATION -toProfilePage
  void _toProfilePage(BuildContext context){
    //Pop the drawer first 
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ProfilePage()));
  }//_toProfilePage

//NAVIGATION - toLoginPage
  void _toPrivacyPage(BuildContext context){
    //Pop the drawer first 
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => PrivacyPage()));
  }//_toLoginPage

} //HomePage
