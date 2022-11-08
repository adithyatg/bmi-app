import 'package:flutter/material.dart';
import 'package:trial_project/second_pg.dart';

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
      // initialRoute: '/',
      // routes: {
      //   '/' : (context)=>Demo(),
      //   '/second' : (context)=>SecondPage(res: res)
      // },
    );
  }
}

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  double res = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 200.0, vertical: 50),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Image.asset(
              'images/bmi.jpg',
              width: 700.0,
              height: 140.0,
              fit: BoxFit.fill,
            ),
            Text(
              "\n\n"
            ),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'height in cm',
                icon: Icon(Icons.trending_up),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'weight in kg',
                icon: Icon(Icons.line_weight),
              ),
            ),

            SizedBox(height: 35),
            Text(
              // res == 0 ? "Enter Value of height between 100 and 200 and weight greater than 0" : "BMI: ${res.toStringAsFixed(2)}",
              res == 0 ? "Enter Value of height between 100 and 200 and weight greater than 0" : "Enter Value of height between 100 and 200 and weight greater than 0",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (weightController.text !=0 && heightController.text!=0 )  ? calculateBMI:(){},
        tooltip: 'Calculate',
        child: Text(
          'Calc',
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void calculateBMI() {
    if(double.parse(heightController.text)>100 && double.parse(heightController.text)<200 && double.parse(weightController.text)>0) {

      double height = double.parse(heightController.text) / 100;
      double weight = double.parse(weightController.text);

      double heightSquare = height * height;
      double result = weight / heightSquare;
      res = result;
      setState(() {});
    }
    else
    {
      res=0;
    }
    Navigator.push(context, MaterialPageRoute(builder:(context)=> SecondPage(res: res,)) );

    //Navigator.pushNamed(context, '/second')
  }
}