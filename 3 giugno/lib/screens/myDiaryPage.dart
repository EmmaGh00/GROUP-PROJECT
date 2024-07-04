// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:project_test1/screens/homePage.dart';

class MyDiaryPage extends StatefulWidget { 
  
  @override
  _MyDiaryPageState createState() => _MyDiaryPageState();
} //LoginPage

class _MyDiaryPageState extends State<MyDiaryPage> {
  
  final TextEditingController _controller = TextEditingController();
  String _displayText = "";
  
  void _sendText() {
    setState() {
      _displayText = _controller.text;
      _controller.clear();
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       // backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        title: Text('MyDiary',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Tieni il diario dei tuoi pensieri, sfogati qui.',
                border: OutlineInputBorder(),
              )
            ),
            SizedBox(height:10),
            ElevatedButton(
              onPressed: _sendText,
              child: Text('Invia'),
            ),
            SizedBox(height:20),
            Text(
              _displayText,
              style: TextStyle(fontSize:20),
            )
          ]
        )
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

