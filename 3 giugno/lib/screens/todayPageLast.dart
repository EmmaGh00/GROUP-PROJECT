import 'package:flutter/material.dart';
import 'package:project_test1/screens/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodayPageLast(),
    );
  }
}

class TodayPageLast extends StatefulWidget {
  @override
  _TodayPageLastState createState() => _TodayPageLastState();
}

class _TodayPageLastState extends State<TodayPageLast> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Today',
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
                    Text('Today you have already given your answer. Come back Tomorrow! \n Have a nice day!'),
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
}

class Question {
  final String questionText;
  final bool isTrue;

  Question({required this.questionText, required this.isTrue});
}


class QuizQuestion extends StatelessWidget {
  final Question question;
  final Function(bool) answerQuestion;

  QuizQuestion({required this.question, required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            question.questionText,
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: ()
            => answerQuestion(true),

            child: Text('Yes'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => answerQuestion(false),
            child: Text('No'),
             ),
        ],
      )
      
     
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