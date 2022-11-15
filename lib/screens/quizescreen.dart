import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mathyourbrain/screens/scorescreen.dart';

import '../question/Question.dart';


class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  //define the datas
  List<Question> questionList = getQuestions();
  static int currentQuestionIndex = 0;
  int score = 0;
  double seconds = 0;
  double secondsMax = 30;
  Answer? selectedAnswer;
  static int timer = 10;
  String showTimer = "10";
  static double values = 0;
  static int totalTime = 0;
  @override
  void initState() {
    startTimer();
    super.initState();
  }


  void startTimer() async {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        if(timer < 1) {
          if (currentQuestionIndex == questionList.length - 1) {
            // showDialog(context: context, builder: (_) => ScoreScreen());
            Navigator.of(context).push(MaterialPageRoute( builder: (context) => ScoreScreen(score: score.toString(), time: totalTime)));
          }
          values = 0;
          timer = 10;
          _nextQuestion();
        }
        timer = timer - 2;
        totalTime++;
        values = values + 0.1;
        showTimer = timer.toString();
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    //elapsedTime();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child:
        Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          const Text(
            "Simple Quiz App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          _questionWidget(),
          _answerList(),
          _nextButton(),

        ]),

      ),

    );
  }

  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [


        Container(
          margin: const EdgeInsets.only(left: 160, bottom: 10),
          child: Text.rich(
              TextSpan(
                  children: [
                    WidgetSpan(child: Icon(Icons.timer_rounded, color: Colors.black, size: 25,),),

                    TextSpan(text: showTimer,
                        style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),

                  ]
              )

            // style: const TextStyle(
            // color: Colors.black38,
            // fontSize: 14,
            // fontWeight: FontWeight.w600,
            // ),

          ),),

        LinearProgressIndicator(
          backgroundColor: Colors.grey,
          color: Colors.lightGreen,
          minHeight: 5,
          value: values,
        ),

        Text(
          "Question ${currentQuestionIndex + 1} of ${questionList.length.toString()}",
          style: const TextStyle(
            color: Colors.black38,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(38),
          // decoration: BoxDecoration(
          //   color: Colors.orangeAccent,
          //   borderRadius: BorderRadius.circular(16),
          // ),
          child: Text(
            questionList[currentQuestionIndex].questionText,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }

  _answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answersList
          .map(
            (e) => _answerButton(e),
      ).toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 48,
      child: ElevatedButton(
        child: Text(answer.answerText),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: isSelected ? Colors.blue : Colors.white,
          onPrimary: isSelected ? Colors.white : Colors.black,
        ),
        onPressed: () {
          if (selectedAnswer == null) {
            if (answer.isCorrect) {
              score++;
            }
            setState(() {
              selectedAnswer = answer;
            });
          }
        },
      ),
    );
  }

  void _nextQuestion() {
    setState(() {
      selectedAnswer = null;
      currentQuestionIndex++;
    });
  }

  _nextButton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }

    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 48,
      child: ElevatedButton(
        child: Text(isLastQuestion ? "Submit" : "Next"),
        style:

        ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: Colors.black,
          onPrimary: Colors.white,
        ),
        onPressed: () {
          if (isLastQuestion) {

            // showDialog(context: context, builder: (_) => ScoreScreen());
            Navigator.of(context).push(MaterialPageRoute( builder: (context) => ScoreScreen(score: score.toString(), time: totalTime)));
          } else {
            values = 0;
            timer = 10;
            _nextQuestion();
          }
        },
      ),
    );

  }

}