import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_test1/screens/homePage.dart';

class Motivation extends StatefulWidget {
  
  @override
  _MotivationPageState createState() => _MotivationPageState();
}

class _MotivationPageState extends State<Motivation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       // backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(    
        title: Text('Why',
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
            
            // COLONNA
            Column(
              children: [ 
                
                // RIGA 1: Immagine - Frase
                Expanded(
                  child: Row(
                    
                    children: [
                      Image.network(
                        'https://st.depositphotos.com/1646956/4302/v/450/depositphotos_43027069-stock-illustration-hand-drawing-cartoon-of-happy.jpg',
                        width: 200,
                        height: 200,
                        ),

                      Container(
                        padding: EdgeInsets.all(5.0),
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 187, 16, 16),
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [
                            BoxShadow(
                              color:Colors.red.withOpacity(0.5),
                              spreadRadius:2,
                              blurRadius: 5,
                              offset: Offset(0,3),
                            )
                          ]
                        ),
                        width: 200,
                        height: 150,
                        
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'IN EVERY MOMENT OF STRUGGLE, REMEMBER THE LOVE OF YOUR FAMILY',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18,
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                      )

                    ],
                  ),
                ),

                //RIGA 2: Immagine - Frase
                Expanded(
                  child: Row(
                    children: [

                      Container(
                        padding: EdgeInsets.all(5.0),
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 20, 36, 212),
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [
                            BoxShadow(
                              color:Colors.blue.withOpacity(0.7),
                              spreadRadius:2,
                              blurRadius: 5,
                              offset: Offset(0,3),
                            )
                          ]
                        ),
                        width: 200,
                        height: 150,
                        
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'SAVE TIME AND MONEY TO DEDICATE THEM TO WHAT YOU REALLY LOVE',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18,
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                      ),

                      Image.network(
                        'https://www.tuttotech.net/wp-content/uploads/2023/03/Apple-iOS-iPadOS-macOS-tvOS-watchOS-HomePod-04.jpg',
                        width: 200,
                        height: 200,
                        ),
                    ],
                  ),
                ),
                
                // RIGA 3: Frase - Immagine
                Expanded(
                  child: Row(
                    children: [
                      Image.network(
                        'https://www.linksium.fr/uploads/meta-images/visuel-PredictTrail-v2.jpg',
                        width: 200,
                        height: 200,
                        ),

                      Container(
                        padding: EdgeInsets.all(5.0),
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 23, 212, 80),
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [
                            BoxShadow(
                              color:Colors.green.withOpacity(0.7),
                              spreadRadius:2,
                              blurRadius: 5,
                              offset: Offset(0,3),
                            )
                          ]
                        ),
                        width: 200,
                        height: 150,
                        
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'INVEST IN YOURSELF; YOUR PASSIONS DESERVE YOUR COMMITMENT',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18,
                              letterSpacing: 0,
                            ),
                          ),
                        ),
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
                    Icons.thumb_up_alt_outlined,
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

// NAVIGATE - toHomePage
  void _toHomePage(BuildContext context){
    //Pop the drawer first 
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
  }//_toCalendarPage
}