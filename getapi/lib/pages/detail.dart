import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  //const DetailPage({ Key? key }) : super(key: key);
  @override
  final v1, v2, v3, v4;
  DetailPage(this.v1, this.v2, this.v3, this.v4);
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  var _v1, _v2, _v3, _v4;
  void initState() {
    super.initState();
    _v1 = widget.v1;
    _v2 = widget.v2;
    _v3 = widget.v3;
    _v4 = widget.v4;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail Page"),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Text(_v1, style: TextStyle(fontSize: 30),),
              Text(_v2, style:TextStyle(fontSize: 25, color: Colors.green) ,),
              Image.network(_v3),
              Text(_v4),
            ],
          ),
        ));
  }
}
