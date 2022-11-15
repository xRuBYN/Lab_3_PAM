import 'package:flutter/material.dart';

import '../main.dart';
class SecondRoute extends State<MyHomePage> {

  int _count = 0;

  void _pressButton() {
    setState(() {
      _count++;
      if (_count >= 5) {
        _count = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 68,
              left: 174,
              child: Image.asset(
                "assets/images/img_1.png",
                height: 12,
                width: 12,
              ),
            ),
            //const MyStatefulWidget(),
            Positioned(
              top: 181,
              left: 24,
              child: Text("Question $_count of 15",
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),

            Positioned(
                top: 211,
                left: 24,
                child: SizedBox(
                  height: 88,
                  width: 342,
                  child: Text("авфпыролраправраврва",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                )
            ),


            Align(
              alignment: const Alignment(0, 0.60),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                  shadowColor: Colors.blueAccent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  minimumSize: const Size(342, 46), //////// HERE
                ),
                onPressed: _pressButton,
                child: const Text('Next'),
              ),
            )
          ],
        )
    );
  }

}