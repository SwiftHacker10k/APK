import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kalkulator Sederhana',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String input = '';
  String output = '';

  // Menambahkan input ke layar
  void buttonPressed(String text) {
    setState(() {
      input += text;
    });
  }

  // Menghitung hasil dari input
  void calculateResult() {
    try {
      setState(() {
        output = (double.parse(input)).toString();
      });
    } catch (e) {
      setState(() {
        output = 'Error';
      });
    }
  }

  // Menghapus input dan output
  void clear() {
    setState(() {
      input = '';
      output = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Sederhana'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              input,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              output,
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            // Baris tombol kalkulator
            Row(
              children: <Widget>[
                calcButton('7'),
                calcButton('8'),
                calcButton('9'),
                calcButton('/'),
              ],
            ),
            Row(
              children: <Widget>[
                calcButton('4'),
                calcButton('5'),
                calcButton('6'),
                calcButton('*'),
              ],
            ),
            Row(
              children: <Widget>[
                calcButton('1'),
                calcButton('2'),
                calcButton('3'),
                calcButton('-'),
              ],
            ),
            Row(
              children: <Widget>[
                calcButton('0'),
                calcButton('.'),
                calcButton('='),
                calcButton('+'),
              ],
            ),
            Row(
              children: <Widget>[
                ElevatedButton(
                  onPressed: clear,
                  child: Text('C', style: TextStyle(fontSize: 30)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Membuat tombol kalkulator
  Widget calcButton(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          if (buttonText == '=') {
            calculateResult();
          } else {
            buttonPressed(buttonText);
          }
        },
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
