import 'dart:html';
import 'dart:js';
import 'package:flutter/material.dart';
import '/pages/detail.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ความรู้เกี่ยวกับคอมพิวเตอร์"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: FutureBuilder(
          builder: (context, AsyncSnapshot snapshot) {
            //var data = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return myBox(snapshot.data[index]['title'], snapshot.data[index]['subtitle'],
                    snapshot.data[index]['image_url'], snapshot.data[index]['detail'], context);
              },
              itemCount: snapshot.data.length,
            );
          },
          future:getData(),
          //future: DefaultAssetBundle.of(context).loadString("data.json"),
        ),
      ),
    );
  }

  Widget myBox(String title, String subtitle, String image_url, String detail, BuildContext context) {
    var v1, v2, v3, v4;
    v1 = title;
    v2 = subtitle;
    v3 = image_url;
    v4 = detail;
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(image_url),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 25,
                color: Colors.yellow,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            subtitle,
            style: TextStyle(fontSize: 15, color: Colors.yellow[100]),
          ),
          SizedBox(height: 20),
          TextButton(
              onPressed: () {
                print("Next Page >>>");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(v1, v2, v3, v4)));
              },
              child: Text("Next Page >>>"))
        ],
      ),
    );
  }
      Future getData() async {
     // https://raw.githubusercontent.com/Kitiwatar/testapi/main/data.json
      var url = Uri.https('raw.githubusercontent.com','/Kitiwatar/testapi/main/data.json');
      var response = await http.get(url);
      var result = json.decode(response.body);
      return result;
    }
}

