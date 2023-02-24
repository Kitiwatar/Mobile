import 'package:flutter/material.dart';
import 'package:secondapp/pages/home.dart';
import 'package:secondapp/pages/calculate.dart';
import 'package:secondapp/pages/contact.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final tabs = [HomePage(), CalculatorPage(), ContactPage()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text("Sawad dee")),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "HomePage"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate), label: "CalculatePage"),
            BottomNavigationBarItem(
                icon: Icon(Icons.contact_mail), label: "ContactPage")
          ],
          onTap: (index) {
            setState(() {
              print(index);
              _currentIndex = index;
            });
          }),
    ));
    ;
  }
}
