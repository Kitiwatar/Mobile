import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  // const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
      return ListView(
      children: [
        Center(
          child: Text("This is HomePage") ,
        )
      ],
    );
  }
}