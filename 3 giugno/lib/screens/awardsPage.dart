// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:project_test1/screens/cinemaAward.dart';
import 'package:project_test1/screens/fitnessAward.dart';
import 'package:project_test1/screens/homePage.dart';
import 'package:project_test1/screens/parkAward.dart';
import 'package:project_test1/screens/smartboxAward.dart';

// DA FARE NELLE SINGOLE PAGINE CREATE (cinema, fitness, park, smartbox)
// IDEA: SCANSIONA IL QR-CODE per scaricare il pdf
// con lo sconto da poter utilizzare direttamente in 'negozio'
// da fare: creare QR CODE con pdf collegato, creare pdf con scritto 'Hai buono sconto in xyz'
// caricare QR CODE come immagine nella pagina corrispettiva


// Impostare un if prima di ONTAP su ogni GestureDetector, in modo che:
// if score> tot punti (specifici per ogni premio), allora puoi premere ONTAP
// else mostra una scritta 'Non hai abbastanza punti per questo premio'

// mettere lo score come variabile in shared preferences e mostrarlo in 'Your score is: ...'

//sistemare la grafica di come si vedono la scritta Your score e le immagini sotto



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
            Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 60),
                      child: Text('Your score is: ',
                        style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 23.0,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.2,
                        ),
                      ),
                    ), 
                  ],
                ),
              ),

              Column(
                children: [ 
                  Expanded(
                    child: Row(

                    children: [
                        GestureDetector(
                          onTap:() {
                             Navigator.push(context, MaterialPageRoute(builder:(context) => cinemaAward()));
                          },
                          child: Image.network(
                            'https://media.istockphoto.com/id/921532564/it/vettoriale/biglietto-del-cinema-isolato-su-sfondo-bianco.jpg?s=612x612&w=0&k=20&c=Ro8v0hq4YnzJZ-zkr-yc8-jbjE1btxYnbtKpzevwgZA=',
                            width: 200,
                            height: 200,
                          )
                        ),

                        GestureDetector(
                          onTap:() {
                             Navigator.push(context, MaterialPageRoute(builder:(context) => fitnessAward()));
                          },
                          child: Image.network(
                            'https://www.earlybirdsco.nz/cdn/shop/files/fitness-gift-box-nz.png?v=1714337481',
                            width: 200,
                            height: 200,
                          )
                        ),
                      ],
                    ),
                  ),
                  
                  
                  Expanded(
                    child: Row(

                    children: [
                        GestureDetector(
                          onTap:() {
                             Navigator.push(context, MaterialPageRoute(builder:(context) => parkAward()));
                          },
                          child: Image.network(
                            'https://media-aws.ticknbox.com/catalog/product/cache/bd5a6537db6ba59dc81f23b0e9d8fff0/t/n/tnb_pt09_mirabilandia_face.jpg',
                            width: 200,
                            height: 200,
                          )
                        ),

                        GestureDetector(
                          onTap:() {
                             Navigator.push(context, MaterialPageRoute(builder:(context) => smartboxAward()));
                          },
                          child: Image.network(
                            'https://media.smartbox.com/pim/640x480/filters:format(webp)/1000002814049820419092.jpg',
                            width: 200,
                            height: 200,
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

