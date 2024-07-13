// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:project_test1/screens/homePage.dart';

class Emergency extends StatefulWidget { 
  
  @override
  _EmergencyState createState() => _EmergencyState();
} //LoginPage

class _EmergencyState extends State<Emergency> {
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
            fontFamily: 'Times New Roman',
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            fontSize: 30,
            letterSpacing: 0.5,
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 60),
                      child: Text('Emergency contact',
                        style: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 25,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                    Padding( 
                      padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [

                          // GREEN NUMBER
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                  child: Icon(
                                    Icons.person_rounded,
                                    color:Colors.black, 
                                    size: 24,
                                  ),
                                ),
                                Text('ITALY GREEN NUMBER ALCOL',
                                  style: TextStyle (
                                    fontFamily: ' Times New Roman',
                                    fontSize: 20.0,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 8, 25),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                  child: Icon(
                                    Icons.phone_rounded,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                                Text(' Phone: 800 63 20 00',
                                  style: TextStyle(
                                      letterSpacing: 0,
                                      fontFamily: 'Times New Roman',
                                      fontSize: 18.0,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // UNIQUE NUMBER
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                  child: Icon(
                                    Icons.person_rounded,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                                Text(' UNIQUE EMERGENCY ITALIAN \n NUMBER',
                                  style: TextStyle (
                                    fontFamily: ' Times New Roman',
                                    fontSize: 20.0,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                  child: Icon(
                                    Icons.phone_rounded,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                                Text(' Phone: 112 ',
                                  style: TextStyle(
                                    letterSpacing: 0,
                                    fontFamily: 'Times New Roman',
                                    fontSize: 18.0,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 500, 0, 0),
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(0, 250, 158, 158),
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: [
                      BoxShadow(
                        color:Color.fromARGB(0, 250, 158, 158),
                        spreadRadius:2,
                        blurRadius: 5,
                        offset: Offset(0,3),
                      )
                    ]
                  ),
                  width: 400,
                  height: 150,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'While you wait for help, remember to keep breathing and stay calm.\nThey are coming...',
                      style: TextStyle(
                        fontFamily: 'Times New Roman',
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20,
                        letterSpacing: 0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Opacity(
                opacity: 0.1,
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.emergency_outlined,
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

  // NAVIGATION - toHomePage
  void _toHomePage(BuildContext context){
    //Pop the drawer first 
    //Navigator.pop(context);
    //Then pop the HomePage
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
  }
}

