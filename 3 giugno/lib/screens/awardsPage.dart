// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:project_test1/screens/homePage.dart';
import 'package:project_test1/screens/SpaAwardsPage.dart';

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
                        IconButton(
                          iconSize: 10,
                          icon: Image.network('https://www.lafeltrinelli.it/images/3608110316065_0_536_0_75.jpg'),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder:(context) => SpaAwardsPage()));
                          },
                        ),
//                        IconButton(
//                          iconSize: 10,
//                          icon: Image.asset(name),
//                          onPressed: _onIconPressed,
 //                       ),
                      ],
                    ),
                  ),

/*                  Expanded(
                    child: Row(
                      children: [
                        IconButton(
                          iconSize: 10,
                          icon: Image.asset(name),
                          onPressed: _onIconPressed,
                        ),
                        IconButton(
                          iconSize: 10,
                          icon: Image.asset(name),
                          onPressed: _onIconPressed,
                        ),
                      ],
                    ),
                  )
                ],
              ),
*/
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
          ],
        ),
      ),
    );
  }

  //NAVIGATION - toSpaAwardsPage
  void _toAwardsPage(BuildContext context){
    //Pop the drawer first 
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SpaAwardsPage()));
  }//_toSpaAwardsPage


  // NAVIGATION - toHomePage
  void _toHomePage(BuildContext context){
    //Pop the drawer first 
    //Navigator.pop(context);
    //Then pop the HomePage
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
  }
}

