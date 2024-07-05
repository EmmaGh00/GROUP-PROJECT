// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_test1/screens/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';


enum Gender {male,female,other}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();


  TextEditingController _weightController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _emergencyController = TextEditingController();
  

  final DateTime _birthdate = DateTime(1990, 5, 15);
  Gender? _selectedGender;

  @override

  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _weightController.text = prefs.getString('weight') ?? '';
      _heightController.text = prefs.getString('height') ?? '';
      _emailController.text = prefs.getString('email') ?? '';
      _phoneController.text = prefs.getString('phone') ?? '';
      _addressController.text = prefs.getString('address') ?? '';
      _emergencyController.text = prefs.getString('emergency') ?? '';

    });
  }

  Future<void> _saveProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('weight', _weightController.text);
    prefs.setString('height', _heightController.text);
    prefs.setString('email', _emailController.text);
    prefs.setString('phone', _phoneController.text);
    prefs.setString('address', _addressController.text);
    prefs.setString('emergency', _emergencyController.text);

  }

  @override
  void dispose() {
    _saveProfileData();
    _weightController.dispose();
    _heightController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _emergencyController.dispose();
    super.dispose();
  }

  // AGGIUNGERE ALTRI CAMPI

  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Data',
         style: TextStyle(
            fontFamily: 'Outfit',
            color: Colors.blue,
            fontSize: 22,
            letterSpacing: 0,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: ()
          => _toHomePage(context), icon: Icon(Icons.arrow_back))
        ),
      
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //DATI FISSI

                // USERNAME
                Text('Username: ',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 0.0),
                TextField(
                  decoration: InputDecoration(
                    filled:true,
                    fillColor:Colors.black.withOpacity(0.1),
                    hintText: 'fjUj9CGlJ5',
                  ),
                  readOnly: true,
                ),
                SizedBox(height: 15.0),

                // PASSWORD
                Text('Password ',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 0.0),
                TextField(
                  decoration: InputDecoration(
                    filled:true,
                    fillColor:Colors.black.withOpacity(0.1),
                    hintText: '12345678!',
                  ),
                  readOnly: true
                ),
                SizedBox(height: 15.0),

                // NAME
                Text('Name ',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16.0,
                 ),
                ),
                SizedBox(height: 0.0),
                TextField(
                  decoration: InputDecoration(
                    filled:true,
                    fillColor:Colors.black.withOpacity(0.1),
                    hintText: 'Giacomo',
                  ),
                  readOnly: true
                ),
                SizedBox(height: 15.0),

                // SURNAME
                Text('Surname ',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 0.0),
                TextField(
                  decoration: InputDecoration(
                    filled:true,
                    fillColor:Colors.black.withOpacity(0.1),
                    hintText: 'Cappon',
                  ),
                  readOnly: true
                ),
                SizedBox(height: 15.0),

                //DATE
                Text('Data di nascita',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 0.0),
                Row(
                  children: [
                    // Giorno 
                    Container(
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        border: Border.all(),
                      ),
                      child: Text('${_birthdate.day}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),

                    // Mese
                    Container(
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        border: Border.all(),
                      ),
                      child: Text('${_birthdate.month}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),

                    // Anno
                    Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        border: Border.all(),
                      ),
                      child: Text('${_birthdate.year}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
               
               // DATI MODIFICABILI

                //GENDER
                Text('Genere:',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 0.0),
                ToggleButtons(
                  children: [
                    Text('M'),
                    Text('F'),
                    Text('O'),
                  ],
                  isSelected: [
                    _selectedGender == Gender.male,
                    _selectedGender == Gender.female,
                    _selectedGender == Gender.other,
                  ],
                  onPressed: (int index) {
                    setState(() {
                      _selectedGender = index == 0
                        ? Gender.male
                        : index == 1
                        ? Gender.female
                        : Gender.other;
                    });
                  },
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.black,
                  selectedColor: Colors.black,
                  fillColor: Colors.black.withOpacity(0.1),
                  borderColor: Colors.black,
                  selectedBorderColor: Colors.black,
                  borderWidth: 1.0,
                  constraints: BoxConstraints(minHeight: 50.0, minWidth: 50.0),
                ),

                //WEIGHT
                TextFormField(
                  controller: _weightController,
                  decoration: InputDecoration(labelText: 'Weight'),
                  //readOnly: true, (non andava quando c'era questo comando)
                  //initialValue: peso,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter weight [kg]';
                    }
                      return null;
                  },
                ),

                //HEIGHT
                TextFormField(
                  controller: _heightController,
                  decoration: InputDecoration(labelText: 'Height'),
                  //readOnly: true, (non andava quando c'era questo comando)
                  //initialValue: height,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter height [cm]';
                    }
                    return null;
                  },
                ),

                //MAIL
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'eMail'),
                  //readOnly: true, (non andava quando c'era questo comando)
                  //initialValue: email,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter email';
                    }
                    return null;
                  },
                ),

                //TELEFONO
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  //readOnly: true, (non andava quando c'era questo comando)
                  //initialValue: numeroTelefono,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter phone number';
                    }
                    return null;
                  },
                ),

                //DOMICILIO
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(labelText: 'Address'),
                  //readOnly: true, (non andava quando c'era questo comando)
                  //initialValue: domicilio,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter address';
                    }
                    return null;
                  },
                ),

                //CONTATTO EMERGENZA
                TextFormField(
                  controller: _emergencyController,
                  decoration: InputDecoration(labelText: 'Emergency phone number contact'),
                  //readOnly: true, (non andava quando c'era questo comando)
                  //initialValue: contattoEmergenza,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter emergency phone number';
                    }
                    return null;
                  },
                   /*onChanged: (value) {
                    setState(() {
                      contattoEmergenza= value;
                    });
                     onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Emergency(this.contattoEmergenza)));
                      };*/
                ),

                // e di gestire i cambiamenti con onChanged (se necessario)
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _saveProfileData,
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
   void _toHomePage(BuildContext context){
    //Pop the drawer first 
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
  }//_toCalendarPage
}



