import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(ContactPage());
}

class ContactPage extends StatefulWidget {
  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(children: [
          Text("ช่องทางการติดต่อ"),
          Image.asset("assets/image/63160234.jpg", width: 250),
          SizedBox(
            height: 50,
          ),
          Text("Kitiwat"),
        ])
      ],
    );
    ;
  }
}
