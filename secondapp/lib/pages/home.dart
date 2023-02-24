import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(children: [
          Text("Kaao Oat Shop"),
          Image.network(
              "https://png.pngtree.com/png-vector/20201129/ourlarge/pngtree-oat-png-image_2416582.jpg",
              width: 350),
          Text("HomePage"),
        ])
      ],
    );
  }
}
