import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class updatePage extends StatefulWidget {
  // const updatePage({super.key});
  final v1, v2, v3;
  const updatePage(this.v1, this.v2, this.v3);
  @override
  State<updatePage> createState() => _updatePageState();
}

class _updatePageState extends State<updatePage> {
  TextEditingController title = TextEditingController();
  TextEditingController detail = TextEditingController();

  var _v1, _v2, _v3;
  @override
  void initState() {
    super.initState();
    _v1 = widget.v1;
    _v2 = widget.v2;
    _v3 = widget.v3;
    title.text = _v2;
    detail.text = _v3;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("แก้ไข")),
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
      // var url = Uri.http('127.0.0.1:8000', '/api/post_todolist/');
      var url = Uri.http('localhost:8000', '/api/update_todolist/${_v1}');
      //ประเภทของ Data ที่เราจะส่งไป เป็นแบบ json
      Map<String, String> header = {"Content-type": "application/json"};
      //Data ที่จะส่ง
      String jsondata = '{"title":"${title.text}", "detail":"${detail.text}"}';

      //เป็นการ Response ค่าแบบ POST
      var response = await http.put(url, headers: header, body: jsondata);
      print('------result-------');
      print(response.body);
    } catch (err) {
      print("error");
      print(err);
    }
  }
}
