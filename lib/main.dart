import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff222222),
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Center(
            child: Text(
              'Quiz App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
              ),
            ),
          ),
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAns(bool userPicked) {
    bool crtAns = quizBrain.getQuesAns();
    setState(() {
      if (quizBrain.isFinished()) {
        Alert(
          context: context,
          title: "Perfect!",
          desc: "You have reached the end of the Quiz.",
          buttons: [
            DialogButton(
              onPressed: () {
                setState(() {
                  scoreKeeper = [];
                  quizBrain.reset();
                });
                Navigator.pop(context);
              },
              width: 120,
              child: const Text(
                "Play",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ).show();
      } else {
        if (userPicked == crtAns) {
          scoreKeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
              size: 32.0,
            ),
          );
        } else {
          scoreKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
              size: 32.0,
            ),
          );
        }
      }
      quizBrain.getNextQues();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              quizBrain.getQuesText(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
          ),
        ),
        Expanded(
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.zero),
              ),
            ),
            child: const Text(
              'True',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            onPressed: () {
              checkAns(true);
            },
          ),
        ),
        const SizedBox(height: 40.0),
        Expanded(
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.zero),
              ),
            ),
            child: const Text(
              'False',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            onPressed: () {
              checkAns(false);
            },
          ),
        ),
        const SizedBox(height: 10.0),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
