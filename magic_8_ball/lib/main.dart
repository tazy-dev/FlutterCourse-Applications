import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  const BallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Ask Me Anything"),
        backgroundColor: Colors.blue.shade900,
      ),
      backgroundColor: Colors.blue,
      body: const Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  const Ball({super.key});

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  int answerNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            answerNumber = Random().nextInt(5) + 1;
          });
        },
        child: Image.asset("images/ball$answerNumber.png"),
      ),
    );
  }
}
