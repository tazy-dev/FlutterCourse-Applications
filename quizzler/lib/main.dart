import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();
void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
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
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> score = [];
  int correctAnswers = 0;
  int totalAnnswers = quizBrain.getLength();

  checkAnswer(
    bool choosenAnswer,
  ) {
    bool correctAnswer = quizBrain.getAnswer();
    setState(
      () {
        if (choosenAnswer == correctAnswer) {
          score.add(
            Icon(
              Icons.check,
              color: Colors.green.shade600,
            ),
          );
          correctAnswers++;
        } else {
          score.add(
            Icon(
              Icons.close,
              color: Colors.red.shade600,
            ),
          );
        }
        if (quizBrain.quizEnd()) {
          Alert(
            type: AlertType.success,
            context: context,
            title: "Quiz Complete",
            desc:
                " Your completed the Quiz with ${((correctAnswers / totalAnnswers) * 100).floor()} % Accuracy",
            buttons: [
              DialogButton(
                child: const Text("DONE"),
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    correctAnswers = 0;
                    quizBrain.resetCounter();
                    score.clear();
                  });
                },
              ),
            ],
          ).show();
        } else {
          quizBrain.nextQ();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                textStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                textStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
              child: const Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: score,
        )
      ],
    );
  }
}
