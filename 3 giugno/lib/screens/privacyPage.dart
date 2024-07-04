// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:project_test1/screens/homePage.dart';

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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 60),
                      child: Text('This app respects the rigths under GDPR (General Data Regulation Protection), so you have the rights:',
                        style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 23.0,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.2,
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
                                Text(' to be informed about the collection and use of your personal data',
                                  style: TextStyle (
                                    fontFamily: 'Arial',
                                    fontSize: 17.0,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: 0.2,
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
                                Text('to access and receive copy of your personal data',
                                  style: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 17.0,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: 0.2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8,0, 0),
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
                                
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // PERSONAL NUMBER
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(2, 20, 0, 60),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                  child: Icon(
                                    Icons.person_rounded,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                                Text('to have inaccurate personal data rectified or complete',
                                  style: TextStyle(
                                    letterSpacing: 0.2,
                                    fontFamily: 'Arial',
                                    fontSize: 17.0,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 20),
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
                                
                              ],
                            ),
                          ),
                        ],
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

