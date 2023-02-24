import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projectcrud/main.dart';
import 'package:projectcrud/pages/add.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Listdata extends StatefulWidget {
  const Listdata({super.key});

  @override
  State<Listdata> createState() => _ListdataState();
}

class _ListdataState extends State<Listdata> {
  @override
  List dataListItem = [
    'Book title 1',
    'Book title 2',
    'Book title 3',
    'Book title 4',
    'Book title 5'
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Data"),
      ),
      body: listdataCreate(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget listdataCreate() {
    return ListView.builder(
      itemCount: dataListItem.length,
      itemBuilder: (context, index) {
        return Card(
            child: ListTile(
              leading: FlutterLogo(),
          title: Text("title $index"),
        ));
      },
    );
  }
}
Future<void> getData() async{
  var url = Uri.http("10.80.74.246:8080","/api/v3/user/theUser");
  var respone = await http.get(url);
  var result = json.decode(respone.body);
  print(result);
}
