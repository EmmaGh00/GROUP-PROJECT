// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_test1/screens/homePage.dart';

class MyDiaryPage extends StatefulWidget { 
  
  @override
  _MyDiaryPageState createState() => _MyDiaryPageState();
} //LoginPage

class _MyDiaryPageState extends State<MyDiaryPage> {
  
  TextEditingController _controller = TextEditingController();
  List<String> _messages = [];


  @override

  void initState() {
    super.initState();
    _loadMessages();
  }

   void _loadMessages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? messagesString = prefs.getString('messages');
    if (messagesString != null) {
      setState(() {
        _messages = List<String>.from(json.decode(messagesString));
      });
    }
  }


  void _saveMessages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('messages', json.encode(_messages));
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty){
      setState((){
        _messages.add(_controller.text);
        _controller.clear();
        _saveMessages();
      });
    }
  }

  void _clearMessages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('messages');
    setState(() {
      _messages.clear();
    });
  }



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
        ),
        actions: [
          IconButton(icon:Icon(Icons.delete),
          onPressed: _clearMessages,
          ),
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Keep a diary of your thoughts, write down them here.',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_messages[index]),
                );
              },
            ),
          ),
          Opacity(
                opacity: 0.1,
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.auto_stories_outlined,
                    color: Colors.blue,
                    size: 300,
                  ),
                ),
              ),
        ],
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

