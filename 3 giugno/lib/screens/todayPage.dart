// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:project_test1/models/score.dart';
import 'package:provider/provider.dart';
import 'package:project_test1/screens/homePage.dart';

class Today extends StatefulWidget { 
  
  @override
  _TodayState createState() => _TodayState();
} //LoginPage

class _TodayState extends State<Today> {
  //final String contattoEmergenza;

//Emergency(this.contattoEmergenza);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       // backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(    
        title: Text('Emergency',
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
        leading: IconButton(
          onPressed: () 
            => _toHomePage(context), icon: Icon(Icons.arrow_back)
        )
      ),

      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Punteggio: ${Provider.of<ScoreModel>(context).score}'),
                    ElevatedButton(
                      onPressed: () {
                        Provider.of<ScoreModel>(context, listen: false).incrementScore();
                      },
                      child: Text('Incrementa'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Provider.of<ScoreModel>(context, listen: false).resetScore();
                      },
                      child: Text('Resetta Punteggio'),
                    ),
                  
                    Opacity(
                      opacity: 0.1,
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.blue,
                          size: 300,
                          ),
                        ),
                    ),
                  ],
              ),
            ), 
          ],
        ),
      ),
    );
  }

  // NAVIGATION - toHomePage
  void _toHomePage(BuildContext context){
    //Pop the drawer first 
    //Navigator.pop(context);
    //Then pop the HomePage
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
  }
}

