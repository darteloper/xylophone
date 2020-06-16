import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(String soundNote) {
    final player = AudioCache();
    player.play('note$soundNote.wav');
  }

  Widget buildKey({Color primary, Color accent, String note, double spacing}) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: spacing),
        child: RawMaterialButton(
          fillColor: primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60.0),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 9, horizontal: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
              border: Border.all(
                color: accent,
                width: 5.0,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: accent,
                  radius: 8.0,
                ),
                CircleAvatar(
                  child: Text(
                    note,
                    style: TextStyle(
                      color: primary,
                    ),
                  ),
                  backgroundColor: accent,
                ),
                CircleAvatar(
                  backgroundColor: accent,
                  radius: 8.0,
                ),
              ],
            ),
          ),
          onPressed: () {
            playSound(note);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white12,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(
                primary: Colors.red.shade800,
                accent: Colors.redAccent.shade100,
                note: 'DO',
                spacing: 16,
              ),
              buildKey(
                primary: Colors.deepOrange.shade700,
                accent: Colors.deepOrangeAccent.shade100,
                note: 'RE',
                spacing: 24,
              ),
              buildKey(
                primary: Colors.orange,
                accent: Colors.orangeAccent.shade100,
                note: 'MI',
                spacing: 32,
              ),
              buildKey(
                primary: Colors.green,
                accent: Colors.greenAccent,
                note: 'FA',
                spacing: 40,
              ),
              buildKey(
                primary: Colors.lightGreen,
                accent: Colors.lightGreenAccent,
                note: 'SOL',
                spacing: 48,
              ),
              buildKey(
                primary: Colors.lightBlue,
                accent: Colors.lightBlueAccent.shade100,
                note: 'LA',
                spacing: 56,
              ),
              buildKey(
                primary: Colors.deepPurple,
                accent: Colors.deepPurpleAccent.shade100,
                note: 'SI',
                spacing: 64,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
