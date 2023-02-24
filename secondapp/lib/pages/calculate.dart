import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  TextEditingController quantity = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController total = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    total.text = "ซื้อน้ำมะพร้าว X ขวด ราคา  y บาท รวมราคาสุทธิ z บาท";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: Center(
              child: Column(
            children: [
              Text(
                "โปรแกรมคำนวณ",
                style: TextStyle(fontSize: 28),
              ),
              TextField(
                controller: quantity,
                decoration: InputDecoration(
                    labelText: 'จำนวนน้ำมะพร้าว', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: price,
                decoration: InputDecoration(
                    labelText: 'ราคาขวดละ', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                "https://foodal.com/wp-content/uploads/2015/02/My-Obession-With-Coconut-Milk-2.jpg",
                width: 200,
              ),
              ElevatedButton(
                onPressed: () {
                  var cal =
                      double.parse(quantity.text) * double.parse(price.text);
                  print(
                      "Tree Quantity : ${quantity.text} Price of one: ${price.text} Total: $cal Bath");

                  setState(() {
                    total.text =
                        "ซื้อน้ำมะพร้าวจำนวน ${quantity.text} ต้น ราคาขวดละ ${price.text} บาท รวมราคาสุทธิ $cal บาท";
                  });
                },
                child: Text("คำนวณ"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF03A9F4)),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.fromLTRB(50, 20, 50, 20)),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20)),
                ),
              ),
              Text(
                total.text,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          )),
        )
      ],
    );
    ;
  }
}
