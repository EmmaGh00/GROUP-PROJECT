// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:project_test1/screens/awardsPage.dart';


class cinemaAward extends StatefulWidget { 
  
  @override
  _cinemaAwardState createState() => _cinemaAwardState();
} //LoginPage

class _cinemaAwardState extends State<cinemaAward> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       // backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(    
        title: Text('CINEMA TICKETS Awards',
          style: TextStyle(
            fontFamily: 'Outfit',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
            color: Colors.blue,
            fontSize: 25,
            letterSpacing: 0,
          ),
        ),
        centerTitle: true,
        elevation: 2,
        leading: IconButton(
          onPressed: () 
            => _toHomePage(context), icon: Icon(Icons.arrow_back)
        )
      ),
    );
  }

  // NAVIGATION - toAwardsPage
  void _toHomePage(BuildContext context){
    //Pop the drawer first 
    //Navigator.pop(context);
    //Then pop the HomePage
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (_) => AwardsPage()));
  }
}
