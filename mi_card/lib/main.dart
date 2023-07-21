import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "images/background.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage("images/Taz Profile.jpg"),
                ),
                const Text(
                  "Mohamed Almuetaz Atif",
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico',
                  ),
                ),
                Text(
                  "FLUTTER DEVELOPER",
                  style: TextStyle(
                    color: Colors.deepOrange.shade100,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Soucre Sans 3',
                    letterSpacing: 2.5,
                  ),
                ),
                //* divider
                SizedBox(
                  height: 20,
                  width: 150,
                  child: Divider(
                    color: Colors.deepOrange.shade100,
                  ),
                ),
                Card(
                  elevation: 10,
                  shadowColor: Colors.black45,
                  color: Colors.white,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: const Icon(
                      Icons.phone,
                      color: Colors.deepOrange,
                      size: 30,
                    ),
                    title: Text(
                      "+249 116185347",
                      style: TextStyle(
                        color: Colors.deepOrange.shade900,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Soucre Sans 3',
                        letterSpacing: 1.75,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Card(
                  elevation: 10,
                  shadowColor: Colors.black45,
                  color: Colors.white,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: const Icon(
                      Icons.email,
                      color: Colors.deepOrange,
                      size: 30,
                    ),
                    title: Text(
                      "tazykaharaba2@gmail.com",
                      style: TextStyle(
                        color: Colors.deepOrange.shade900,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Soucre Sans 3',
                      ),
                    ),
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
