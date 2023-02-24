import 'package:flutter/material.dart';
import 'package:midterm88837459/pages/detailApi.dart';
import 'package:midterm88837459/pages/login.dart';
import 'package:midterm88837459/pages/apiCovid.dart';



void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

// class MyApp extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Midterm',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: LoginPage(),
//     );
//   }
// }

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final tabs = [LoginPage(),apiCovid()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text("Midterm")),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "HomePage"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate), label: "APICovidPage"),
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

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});


//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: LoginPage()
//     );
//   }
// }
