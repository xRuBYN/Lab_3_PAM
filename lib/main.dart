// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mathyourbrain/question/Question.dart';
import 'package:mathyourbrain/screens/quizescreen.dart';
import 'package:mathyourbrain/screens/secondsreen.dart';

void main() {

  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 63,
              right: 16,
              left: 16,
              bottom: 423,
              child: Image.asset(
                "assets/images/img.png",
                height: 358,
                width: 358,
              ),
            ),
            const Align(
              alignment: Alignment(0, 0.2),
              child: Text(
                "Math for \neveryone",
                style: TextStyle(
                  fontSize: 48,
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.55),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                  shadowColor: Colors.blueAccent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  minimumSize: const Size(280, 46), //////// HERE
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizScreen()),
                  );
                },
                child: const Text('Start'),
              ),
            ),
          ],
        ));
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  SecondRoute createState() => SecondRoute();
}

