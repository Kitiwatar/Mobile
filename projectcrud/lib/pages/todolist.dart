import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projectcrud/pages/add.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:projectcrud/pages/update.dart';

class Todolist extends StatefulWidget {
  // const _TodolistState({super.key});

  @override
  State<Todolist> createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
  //dummy ต้นแบบข้อมูล
  List todolistitems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTodolist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPage()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('All Todolist'),
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
      body: (todolistCreate()),
    );
  }

  Widget todolistCreate() {
    return ListView.builder(
      itemCount: todolistitems.length,
      itemBuilder: ((context, index) {
        return Card(
          child: ListTile(
            title: Text("${todolistitems[index]['title']}"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => updatePage(
                            todolistitems[index]['id'],
                            todolistitems[index]['title'],
                            todolistitems[index]['detail'],
                          )));
            },
          ),
        );
      }),
    );
  }

  // Future<void> getTodolist() async {
  //   // List alltodo = [];
  //   //http://10.80.25.48:8000/api/all-todolist/
  //   var url = Uri.parse('127.0.0.1:8000/api/all-todolist/');
  //   var response = await http.get(url);
  //   var result = json.decode(response.body);
  //   print('Test--------');
  //   print(result);
  //   setState(() {
  //     todolistitems = result;
  //   });
  // }
  Future<void> getTodolist() async {
    var url = Uri.http('127.0.0.1:8000', 'api/all-todolist/');
    var response = await http.get(url);
    var result = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200) {
      setState(() {
        todolistitems = jsonDecode(result);
      });
      print(todolistitems);
    } else {
      print('A network error occurred');
    }
  }
}
