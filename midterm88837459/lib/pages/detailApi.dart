import 'package:flutter/material.dart';
import 'package:midterm88837459/pages/apiCovid.dart';
import 'package:http/http.dart' as http;

class DetailPage extends StatefulWidget {
  //const DetailPage({ Key? key }) : super(key: key);
  @override
  final v1;
  DetailPage(this.v1);
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  var _v1, _v2, _v3, _v4;
  void initState() {
    super.initState();
    _v1 = widget.v1;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Text(_v1, style: TextStyle(fontSize: 30),),
            ],
          ),
        ));
  }
}
