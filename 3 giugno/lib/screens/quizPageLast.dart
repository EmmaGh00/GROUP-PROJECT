import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_test1/models/sus.dart';
import 'package:project_test1/screens/homePage.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPageLast(),
    );
  }
}

class QuizPageLast extends StatefulWidget {
  @override
  _QuizPageLastState createState() => _QuizPageLastState();
}

class _QuizPageLastState extends State<QuizPageLast> {
  int totalQuestions = 6;
  int sus = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily quiz',
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
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text('Finish!',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..shader = ui.Gradient.linear(
                            const Offset(0, 20),
                            const Offset(250, 20),
                            <Color> [
                              Color.fromARGB(255, 0, 8, 255).withOpacity(0.5),
                              Color.fromARGB(255, 3, 191, 248).withOpacity(0.5),
                            ]
                          )
                        ),
                      )
                    ),
                    Text('Your score is ${Provider.of<SusModel>(context).sus}/$totalQuestions',
                      style: TextStyle(fontSize: 20),
                    ),
                  ]
              ), 
            ),
            Opacity(
              opacity: 0.1,
              child: Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.quiz_outlined,
                  color: Colors.blue,
                  size: 300,
                ),
              ),
            ), 
          //codice commentato sotto 
          ],
        ),
      ),
    );
  }
}

// NAVIGATION - toHomePage
  void _toHomePage(BuildContext context){
    //Pop the drawer first 
    //Navigator.pop(context);
    //Then pop the HomePage
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
  }
