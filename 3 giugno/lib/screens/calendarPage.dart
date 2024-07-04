import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:project_test1/screens/homePage.dart';

class Calendar extends StatefulWidget {
  
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Calendar',
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
        //title: Text('Calendario'),
          leading: IconButton(
            onPressed: ()
              => _toHomePage(context), icon: Icon(Icons.arrow_back)
          )
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2024, 1, 1),
            lastDay: DateTime.utc(2024, 12, 31),
            focusedDay: _focusedDay,
            
            calendarFormat: _calendarFormat,
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
              outsideTextStyle: TextStyle(color: Colors.grey), // Imposta il colore del testo per i giorni al di fuori del mese
              weekendTextStyle: TextStyle(color: Colors.red),
              todayTextStyle: TextStyle (color:Colors.white),),
            headerStyle: HeaderStyle(
              titleTextStyle: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)
            ),
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          ),
          SizedBox(height: 20),
          if (_selectedDay != null) Text("Data selezionata: $_selectedDay"), //qui dobbiamo mostrare i dati
        ], // children 
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