import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Iam a Flutter Developer'),
          backgroundColor: Colors.deepPurple[700]!.withBlue(125),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'images/vecteezy_mobile-apps-development-concept-with-man-programmer_.jpg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    ),
  );
}
