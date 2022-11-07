import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Demo(),
    );
  }
}

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double _result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'height in cm',
                icon: Icon(Icons.trending_up),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'weight in kg',
                icon: Icon(Icons.line_weight),
              ),
            ),

            SizedBox(height: 15),
            Text(
              _result == 0 ? "Enter Value of height between 100 and 200 and weight greater than 0" : "BMI: ${_result.toStringAsFixed(2)}",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 19.4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: calculateBMI,
        tooltip: 'Calculate',
        child: Text(
          'Calc',
        ),
      ),
    );
  }

  void calculateBMI() {
    if(double.parse(_heightController.text)>100 && double.parse(_heightController.text)<200 && double.parse(_weightController.text)>0) {

      double height = double.parse(_heightController.text) / 100;
      double weight = double.parse(_weightController.text);

      double heightSquare = height * height;
      double result = weight / heightSquare;
      _result = result;
      setState(() {});
    }
    else
    {
      _result=0;
    }
  }
}
