import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Syncfusion Charts with API Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Syncfusion Charts with API Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class ChartsData {
  final int id;
  final int value;

  ChartsData({required this.id, required this.value});
  factory ChartsData.fromJson(Map<String, dynamic> json) {
    return ChartsData(
      id: json['id'],
      value: json['userId'],
    );
  }
}
class _MyHomePageState extends State<MyHomePage> {
  List<ChartsData> data = [];
  @override
    void initState() {
    super.initState();
    getData();
  }
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: data.isEmpty
            ? CircularProgressIndicator()
            : SfCartesianChart(
                primaryXAxis: NumericAxis(),
                series: <ChartSeries>[
                  BarSeries<ChartsData, num>(
                    dataSource: data,
                    xValueMapper: (ChartsData chartData, _) => chartData.id,
                    yValueMapper: (ChartsData chartData, _) => chartData.value,
                  ),
                ],
              ),
      ),
    );
  }
  Future<void> getData() async {
    try {
      final Dio dio = Dio();
      final String baseUrl = 'https://jsonplaceholder.typicode.com';
      final response = await dio.get('$baseUrl/posts');

      if (response.statusCode == 200) {
        List<dynamic> dataJson = response.data;
        setState(() {
          data = dataJson
              .map((json) => ChartsData.fromJson(json))
              .toList();
        });
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      print(e.toString());
    }
  }

}

  Widget build(BuildContext context) {
    return Container();
  }




