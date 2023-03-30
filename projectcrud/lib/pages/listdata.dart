import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projectcrud/main.dart';
import 'package:projectcrud/pages/add.dart';
import 'package:projectcrud/pages/todolist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Listdata extends StatefulWidget {
  const Listdata({super.key});

  @override
  State<Listdata> createState() => _ListdataState();
}

class _ListdataState extends State<Listdata> {
  List todolistitems = [];
  @override
  void initState() {
    super.initState();
    getTodolist();
  }

  List dataListItem =[];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Data"),
        actions: [
          IconButton(
              onPressed: () {
                getTodolist();
              },
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
              ))
        ],
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

  Future<void> getTodolist() async {
    var url = Uri.http('127.0.0.1:8000', 'api/all-todolist/');
    var response = await http.get(url);
    var result = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200) {
      setState(() {
        dataListItem = jsonDecode(result);
      });
      print(dataListItem);
    } else {
      print('A network error occurred');
    }
  }
}

// Future<void> getData() async{
//   var url = Uri.http("10.80.74.246:8080","/api/v3/user/theUser");
//   var respone = await http.get(url);
//   var result = json.decode(respone.body);
//   print(result);
// }
// Future<void> getTodolist() async {
//   List alltodo = [];
//   //http://10.80.25.48:8000/api/all-todolist/
//   var url = Uri.http('127.0.0.1:8000', '/api/all-todolist');
//   var response = await http.get(url);
//   var result = json.decode(response.body);
//   print(result);
// }

