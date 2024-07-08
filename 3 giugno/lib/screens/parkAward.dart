// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:project_test1/screens/awardsPage.dart';


class parkAward extends StatefulWidget { 
  
  @override
  _parkAwardState createState() => _parkAwardState();
} //LoginPage

class _parkAwardState extends State<parkAward> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       // backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(    
        title: Text('MIRABILANDIA Awards',
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
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Obtain your gift!'),
            SizedBox(height:10),
            Image.asset('assets/images/mirabilandiaQRCODE.jpeg', width:200,height:200),
          ],
        )
      )
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

