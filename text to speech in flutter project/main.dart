import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(TheApp());
}

class TheApp extends StatelessWidget {
  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();
  String word;
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    _speak(String text) async {
      // await flutterTts.setLanguage(language)
      // await flutterTts.setPitch(pitch)

      await flutterTts.speak(text);
      // textEditingController.text = '';
    }

    return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: textEditingController,
              // maxLength: 50, //setting maximum length of the textfield
            ),
            //SizedBox is an empty box to add space between two elements
            SizedBox(height: 50),
            RaisedButton(
              child: Text('tap to speak'),
              onPressed: () => _speak(textEditingController.text),
            )
          ],
        ));
  }
}
