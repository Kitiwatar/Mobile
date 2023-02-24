import 'dart:html';
import 'dart:js';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:midterm88837459/pages/detailApi.dart';

class apiCovid extends StatefulWidget {
  // const apiCovid({super.key});

  @override
  State<apiCovid> createState() => _apiCovidState();
}

// class _apiCovidState extends State<apiCovid> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child:   FutureBuilder(builder: (context, AsyncSnapshot snapshot) {
//           return ListView.builder(
//             itemBuilder: (BuildContext context, int index) {
//               return myBox(snapshot.data['year'], context);
//             },
//             itemCount: snapshot.data.length,
//           );

//         },
//         future: getData(),
       
//         )
//          ),

//     );
//   }
// }

class _apiCovidState extends State<apiCovid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child:   FutureBuilder(builder: (context, AsyncSnapshot snapshot) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(title:Text(snapshot.data[index]['province'].toString()));
            },
            itemCount: snapshot.data.length,
          );

        },
        future: getData(),
       
        )
         ),

    );
  }
}

// Widget myBox(String year , BuildContext context) {
//     var v1;
//     v1 = year;
//     return Container(
//       padding: EdgeInsets.all(20),
//       margin: EdgeInsets.all(20),
//       height: 250,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             year,
//             style: TextStyle(
//                 fontSize: 25,
//                 color: Colors.yellow,
//                 fontWeight: FontWeight.bold),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//         ],
//       ),
//     );
//   }

 Future getData () async {
    var url =Uri.https('raw.githubusercontent.com','/Kitiwatar/testapi/main/data.json');
    var response = await http.get(url);
    var result = json.decode(response.body);
    print(result);
    return result;
}


