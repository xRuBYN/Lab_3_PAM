import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mathyourbrain/main.dart';



class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key, required this.score, required this.time});
  final String score;
  final int time;

  @override
  Widget build(BuildContext context) {
    String finalTime = time.toString();
    int finalScore = int.parse(score);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "New Rating",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: Colors.grey),
              ),

              Padding(padding: EdgeInsets.only(bottom: 20)),
              Text('${finalScore * 45}', style: TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),),
              Padding(padding: EdgeInsets.only(bottom: 30)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      margin: EdgeInsets.only(),
                      child: Row(
                        children: [
                          Text('Score', style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400)),],
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 50, right: 40),
                      child: Row(
                        children: [
                          Text('Correct', style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400)),],
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 0),
                      child: Row(
                        children: [
                          Text('Completed in', style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400))],
                      )),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 40),
                      child: Row(
                        children: [
                          Text('${finalScore}/4', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold))],
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 90),
                      child: Row(
                        children: [
                          Text('${finalScore}', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold))],
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 80),
                      child: Row(
                        children: [
                          Text('${finalTime}s', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold))],
                      )),

                ],

              ),
              Spacer(),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 50, bottom: 20),
                    child: SizedBox(
                      width: 294,
                      height: 46,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.white54),
                        ),
                        child: Text(
                          'Leave',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          exit(0);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 50),
                    child: SizedBox(
                      width: 294,
                      height: 46,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.black87),
                        ),
                        child: Text(
                          'New Game',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute( builder: (context) => FirstRoute()));
                        },
                      ),
                    ),
                  ),
                ],
              ),

              Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}