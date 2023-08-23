import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PianoTile(
                color: Colors.red,
                note: 1,
              ),
              PianoTile(
                color: Colors.deepOrange,
                note: 2,
              ),
              PianoTile(
                color: Colors.yellow,
                note: 3,
              ),
              PianoTile(
                color: Colors.green,
                note: 4,
              ),
              PianoTile(
                color: Colors.teal,
                note: 5,
              ),
              PianoTile(
                color: Colors.blue,
                note: 6,
              ),
              PianoTile(
                color: Colors.deepPurple,
                note: 7,
              ),
            ],
          ),
        ),
      ),
    );
  }

  playSound(int noteNumber) {
    final player = AudioPlayer();
    player.play(AssetSource("note$noteNumber.wav"));
  }
}

class PianoTile extends StatelessWidget {
  final Color color;
  final int note;
  const PianoTile({
    super.key,
    required this.color,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          XylophoneApp().playSound(note);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            elevation: 10,
            shape: ContinuousRectangleBorder()),
        child: const Text(""),
      ),
    );
  }
}
