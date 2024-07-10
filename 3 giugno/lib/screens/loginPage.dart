import 'package:flutter/material.dart';
import 'package:project_test1/screens/homePage.dart';
import 'package:project_test1/services/impact.dart';


class LoginPage extends StatefulWidget {
  
  @override
  _LoginPageState createState() => _LoginPageState();
} //LoginPage

class _LoginPageState extends State<LoginPage> {

  TextEditingController userController = TextEditingController(); // funzione di controllo sull'username
  TextEditingController passwordController = TextEditingController(); // funzione di controllo sulla password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("My Safe Plan",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            fontFamily: 'Arial', //font, vedi bene il paccheto google font
            letterSpacing:0.5,
            color: Colors.blue,
          ),
        ),
        centerTitle: true, 
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:15.0, right: 15.0, top:0, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: userController, //come controllori servono i dati di registrazione
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  hintText: 'Enter valid Username',
                  icon: Icon(
                    Icons.account_box,
                    color:Colors.blue,
                  ),
                ), 
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 15),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter password',
                  icon: Icon(
                    Icons.visibility_off,
                    color:Colors.blue,
                  ),
                ),
              ),
            ),
            Container( 
              height: 100,
              width: 250,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  ElevatedButton(
                    child: Text('Login',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      )
                    ),
                    onPressed: () async { 
                      if(userController.text == 'fjUj9CGlJ5' && passwordController.text == '12345678!'){
                        final result = await ImpactService.authorize();
                        final message =
                          result == 200 ? 'Request successful' : 'Request failed';
                        ScaffoldMessenger.of(context)
                          ..removeCurrentSnackBar()
                          ..showSnackBar(SnackBar(content: Text(message)));
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
                      }else{
                        ScaffoldMessenger.of(context)
                          ..removeCurrentSnackBar()
                          ..showSnackBar(SnackBar(content: Text('Wrong username/password. Try again'))); //ALLERT
                      } //if
                    }, //onPressed
                  ),
                ], //children
              ),
            ),
            SizedBox(
              height: 130,
            ),
          ], //childrem
        ),
      ),
    );
  } // build
} //class

