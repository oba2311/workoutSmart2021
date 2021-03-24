import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'WorkSmart';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: Center(
          child: MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    int _index = 0;
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      child: Stepper(
        controlsBuilder: (BuildContext context,
          {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
        return Row(
          children: <Widget>[
            TextButton(
              onPressed: onStepContinue,
              child: const Text('Let\'s go'),
            ),
            TextButton(
              onPressed: onStepCancel,
              child: const Text('Opps, wait, back'),
            ),
          ],
        );
      },
        currentStep: _index,
        onStepCancel: () {
          if (_index <= 0) {
            return;
          }
          setState(() {
            _index--;
          });
        },
        onStepContinue: () {
          if (_index >= 1) {
            return;
          }
          setState(() {
            _index++;
          });
        },
        onStepTapped: (index) {
          setState(() {
            _index = index;
          });
        },
        steps: [
          Step(
            title: Text("Start a session 💪",  style: TextStyle(fontSize:22) ,),
            content: Container(
                alignment: Alignment.centerLeft,
                // child: Text("Content for Step 1")),
          ),
          ),
          Step(
            title: Text("Choose an exercise 🏋️",  style: TextStyle(fontSize:22) ,),
            content: Container(
                alignment: Alignment.centerLeft,
                // child: Text("Content for Step 1")),
          ),
          ),
          ],
      ),
    );
  }
  }