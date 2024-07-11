// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_test1/screens/cinemaAward.dart';
import 'package:project_test1/screens/fitnessAward.dart';
import 'package:project_test1/screens/homePage.dart';
import 'package:project_test1/screens/parkAward.dart';
import 'package:project_test1/screens/smartboxAward.dart';
import 'package:project_test1/models/score.dart';

// mettere lo score come variabile in shared preferences e mostrarlo in 'Your score is: ...'

class AwardsPage extends StatefulWidget { 
  
  @override
  _AwardsPageState createState() => _AwardsPageState();
} //LoginPage

class _AwardsPageState extends State<AwardsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       // backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(    
        title: Text('Awards',
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

      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Column(
              children: [ 
                Row(
                  children: [
                    SizedBox(height:20),
                    Text('Your score is: ${Provider.of<ScoreModel>(context).score}',
                        style: TextStyle(fontFamily: 'Arial',
                        fontSize: 23.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.2)
                    ),
                  ],
                ),

                Expanded(
                  child: Row(
                    children: [
                      // titolo sotto icona

                        // CINEMA
                      GestureDetector(
                        onTap:() {
                          if ((Provider.of<ScoreModel>(context, listen:false).score) > 150) {
                            Navigator.push(context, MaterialPageRoute(builder:(context) => cinemaAward()));
                            Provider.of<ScoreModel>(context, listen: false).decrement150Score();
                          } else {
                            ScaffoldMessenger.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(SnackBar(content: Text('You have not enough points. Points needed:150')));
                          }                            
                        },
                        child: Column(
                          children: [
                            Image.network(
                              'https://media.istockphoto.com/id/921532564/it/vettoriale/biglietto-del-cinema-isolato-su-sfondo-bianco.jpg?s=612x612&w=0&k=20&c=Ro8v0hq4YnzJZ-zkr-yc8-jbjE1btxYnbtKpzevwgZA=',
                              width: 200,
                              height: 200,
                            ),
                            SizedBox(height:5),
                            Text('CINEMA - 150 pt', style: TextStyle(fontSize:20))
                          ]
                        )
                      ),

                        // FITNESS
                      GestureDetector(
                        onTap:() {
                          if ((Provider.of<ScoreModel>(context, listen:false).score) > 200) {
                            Navigator.push(context, MaterialPageRoute(builder:(context) => fitnessAward()));
                            Provider.of<ScoreModel>(context, listen: false).decrement200Score();
                          } else {
                            ScaffoldMessenger.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(SnackBar(content: Text('You have not enough points. Points needed:200')));
                          }
                        },
                        child: Column(
                          children: [
                            Image.network(
                              'https://www.earlybirdsco.nz/cdn/shop/files/fitness-gift-box-nz.png?v=1714337481',
                              width: 200,
                              height: 200,
                            ),
                            SizedBox(height:5),
                            Text('FITNESS - 200 pt', style: TextStyle(fontSize:20))
                          ]
                        ),  
                      ),
                    ],
                  ),
                ),
                  
                Expanded(
                  child: Row(
                    children: [
                      // PARK
                      GestureDetector(
                        onTap:() {
                          if ((Provider.of<ScoreModel>(context, listen:false).score) > 250) {
                            Navigator.push(context, MaterialPageRoute(builder:(context) => parkAward()));
                            Provider.of<ScoreModel>(context, listen: false).decrement250Score();
                          } else {
                            ScaffoldMessenger.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(SnackBar(content: Text('You have not enough points. Points needed:250')));
                          }
                        },
                        child: Column(
                          children: [
                            Image.network(
                              'https://media-aws.ticknbox.com/catalog/product/cache/bd5a6537db6ba59dc81f23b0e9d8fff0/t/n/tnb_pt09_mirabilandia_face.jpg',
                              width: 200,
                              height: 200,
                            ),
                            SizedBox(height:5),
                            Text('PARK - 250 pt', style: TextStyle(fontSize:20))
                          ]
                        )
                      ),
                    
                      // SMARTBOX
                      GestureDetector(
                        onTap:() {
                          if ((Provider.of<ScoreModel>(context, listen:false).score) > 300) {
                            Navigator.push(context, MaterialPageRoute(builder:(context) => smartboxAward()));
                            Provider.of<ScoreModel>(context, listen: false).decrement300Score();
                          } else {
                            ScaffoldMessenger.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(SnackBar(content: Text('You have not enough points. Points needed:300')));
                          }
                        },
                        child: Column(
                          children: [
                            Image.network(
                              'https://media.smartbox.com/pim/640x480/filters:format(webp)/1000002814049820419092.jpg',
                              width: 200,
                              height: 200,
                            ),
                            SizedBox(height:5),
                            Text('PARK - 250 pt', style: TextStyle(fontSize:20))
                          ]
                        )
                      ),
                    ],
                  ),
                ),
              ], //children
            ),
            Opacity(
              opacity: 0.1,
              child: Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.emoji_events_outlined,
                  color: Colors.blue,
                  size: 300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  //NAVIGATION - toCinemaAward
  void _toCinemaAward(BuildContext context){
    //Pop the drawer first 
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => cinemaAward()));
  }//_toCinemaAward

  //NAVIGATION - toFitnessAward
  void _toFitnessAward(BuildContext context){
    //Pop the drawer first 
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => fitnessAward()));
  }//_toCinemaAward

  //NAVIGATION - toParkAward
  void _toParkAward(BuildContext context){
    //Pop the drawer first 
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => parkAward()));
  }//_toParkAward

  //NAVIGATION - toSmartboxAward
  void _toSmartboxAward(BuildContext context){
    //Pop the drawer first 
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => smartboxAward()));
  }//_toSmartboxAward

  // NAVIGATION - toHomePage
  void _toHomePage(BuildContext context){
    //Pop the drawer first 
    //Navigator.pop(context);
    //Then pop the HomePage
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
  }
}

/*
Future<void> saveScore(String key,String value) async {
  final score = await SharedPreferences.getInstance();
  await score.setString(key, value);
}

Future<String?> loadScore(String key) async {
  final score = await SharedPreferences.getInstance();
  return score.getString(key);
}

*/
