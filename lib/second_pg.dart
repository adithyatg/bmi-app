import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SecondPage extends StatefulWidget {

  SecondPage({required this.res});
  double res;
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/bmi.jpg"),
          fit: BoxFit.cover,
        )
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Result"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 200.0, vertical: 100),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Image.asset(
                  'images/bmi2.jpg',
                  width: 700.0,
                  height: 240.0,
                  fit: BoxFit.fill,
                ),
                Text(
                    "\n\n"
                    "BMI: ${widget.res.toStringAsFixed(2)}",
                    style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
