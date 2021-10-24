import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/buttonKonversi.dart';
import 'widgets/inputSuhu.dart';
import 'widgets/resultSuhu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = new TextEditingController();

  double inputUser = 0;
  double kelvin = 0;
  double fahrenheit = 0;
  double reamur = 0;

  konversi() {
    //set state
    setState(() {
      inputUser = double.parse(etInput.text);
      reamur = 4 / 5 * inputUser;
      fahrenheit = 9 / 5 * inputUser;
      kelvin = inputUser + 273;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("converter"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InputSuhu(etInput: etInput),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ResultSuhu(result: kelvin, title: "Kelvin"),
                  ResultSuhu(result: reamur, title: "Reamur"),
                  ResultSuhu(result: fahrenheit, title: "Fahrenheit"),
                ],
              ),
              ButtonKonversi(
                konversi: konversi,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
