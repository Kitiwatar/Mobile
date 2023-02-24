import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class AddPage extends StatefulWidget {
  // const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController title = TextEditingController();
  TextEditingController detail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("AddPage")),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              SizedBox(height: 20),
              TextField(
                controller: title,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'รายการที่ต้องทำ',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: detail,
                minLines: 4,
                maxLines: 8,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'รายละเอียด',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  print('------------');
                  print('title: ${title.text}');
                  print('title: ${detail.text}');
                  postTodo();
                  setState(() {
                    title.clear();
                    detail.clear();
                  });
                },
                child: Text("เพิ่มรายการ"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.fromLTRB(50, 20, 50, 20)),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20)),
                ),
              )
            ],
          ),
        ));
  }

  Future postTodo() async {
    try {
      //http://10.80.74.246:8080/api/v3/user
      var url = Uri.http('127.0.0.1:8000', '/api/post_todolist/');
      //ประเภทของ Data ที่เราจะส่งไป เป็นแบบ json
      Map<String, String> header = {"Content-type": "application/json"};
      //Data ที่จะส่ง
      String jsondata = '{"title":"${title.text}", "detail":"${detail.text}"}';

      //เป็นการ Response ค่าแบบ POST
      var response = await http.post(url, headers: header, body: jsondata);
      print('------result-------');
      print(response.body);
    } catch (err) {
      print("error");
      print(err);
    }
  }
}
