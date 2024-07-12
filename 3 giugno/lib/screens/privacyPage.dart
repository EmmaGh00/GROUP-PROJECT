// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:project_test1/screens/homePage.dart';
import 'package:project_test1/provider/data_provider.dart';
import 'package:project_test1/models/score.dart';

class PrivacyPage extends StatefulWidget { 
  
  @override
  _PrivacyPageState createState() => _PrivacyPageState();
} //LoginPage

class _PrivacyPageState extends State<PrivacyPage> {
  //final String contattoEmergenza;

//Emergency(this.contattoEmergenza);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       // backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        title: Text('Privacy',
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
                    Text('This app is compliant to GDPR (General Data Regulation Protection), so you have the rights:',
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 23,
                        letterSpacing: 0,
                      ),
                    ),
                    Text('- to be informed about the collection and use of your personal data; \n- to access and receive copy of your personal data; \n- to have inaccurate personal data rectified or completed; \n- to have personal data erased; \n- to object to the processing of personal data in certain circumstances; \n- to restrict processing of you data; \n- to move, copy or transfer your personal data easily to another controller; \n- not to be subject to automated decision making and profiling.',
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 20,
                        letterSpacing: 0,
                      )
                    ),
                    SizedBox(
                      height: 130,
                    ),
                    Center( 
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.delete_forever_outlined, 
                          color:Colors.blue, 
                          size: 40.0,
                        ),
                        label: Text('Clear all data & reset score',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          )
                        ),
                        onPressed: () {
                          Provider.of<DataProvider>(context, listen: false).clearData();
                          Provider.of<ScoreModel>(context, listen: false).delateScore();
                        },
                      ),
                    )
                ],
              ),
            ),
                   
            Opacity(
              opacity: 0.1,
              child: Align(
                alignment: Alignment.center,
                  child: Icon(
                    Icons.shield_outlined,
                      color: Colors.blue,
                      size: 300,
                      ),
                    ),
              ),
          ],
        ),
      ),   
    );
  } // Widget Build context

  // NAVIGATION - toHomePage
  void _toHomePage(BuildContext context){
    //Pop the drawer first 
    Navigator.pop(context);
    //Navigator.pop(context)
    Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
    //Then pop the HomePage
  } // void toHomePage

} // class

