import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator ',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int firstNum;
  late int secondNum;
  String textDisplay = "";
  late String result;
  late String operator;

  void btnClick(String btnVal) {
    if (btnVal == "C") {
      textDisplay = "";
      firstNum = 0;
      secondNum = 0;
      result = "";
    } else if (btnVal == "+" ||
        btnVal == "-" ||
        btnVal == "*" ||
        btnVal == "/") {
      firstNum = int.parse(textDisplay);
      result = "";
      operator = btnVal;
    } else if (btnVal == "=") {
      secondNum = int.parse(textDisplay);
      if (operator == "+") {
        result = (firstNum + secondNum).toString();
      }
      if (operator == "-") {
        result = (firstNum - secondNum).toString();
      }
      if (operator == "/") {
        result = (firstNum ~/ secondNum).toString();
      }
      if (operator == "*") {
        result = (firstNum * secondNum).toString();
      }
    } else {
      result = int.parse(textDisplay + btnVal).toString();
    }
    setState(() {
      textDisplay = result;
    });
  }

  Widget customButton(String btnVal) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {
          btnClick(btnVal);
        },
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Text(
            "$btnVal",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.only(bottom: 30),
              alignment: Alignment.bottomRight,
              child: Text(
                "$textDisplay",
                style: TextStyle(
                    fontSize: 40,
                    color: Color.fromARGB(255, 0, 52, 148),
                    fontWeight: FontWeight.bold),
              ),
            )),
            Row(
              children: [
                customButton("9"),
                customButton("8"),
                customButton("7"),
                customButton("+"),
              ],
            ),
            Row(
              children: [
                customButton("6"),
                customButton("5"),
                customButton("4"),
                customButton("-"),
              ],
            ),
            Row(
              children: [
                customButton("3"),
                customButton("2"),
                customButton("1"),
                customButton("*"),
              ],
            ),
            Row(
              children: [
                customButton("C"),
                customButton("0"),
                customButton("="),
                customButton("/"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
