import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _stepCounter = 0;
  String value;

  List<Step> steps;

  List<Step> _buildSteps() {
    steps = [
      Step(title: Text("Step 1"), content: Text("Step 1"), isActive: true),
      Step(
          title: Text("Step 2"),
          content: DropdownButton(
              value: value,
              hint: Text("Choose an item"),
              items: [
                DropdownMenuItem(
                  child: Text("Item 1"),
                  value: "Item 1",
                ),
                DropdownMenuItem(
                  child: Text("Item 2"),
                  value: "Item 2",
                )
              ],
              onChanged: (_){}),
          isActive: true)
    ];
    return steps;
  }

  @override
  Widget build(BuildContext context) {
    print("rebuilt");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stepper + DropdownButton"),
        ),
        body: Container(
          child: Stepper(
            currentStep: _stepCounter,
            steps: _buildSteps(),
            type: StepperType.vertical,
            onStepTapped: (step) {
              setState(() {
                _stepCounter = step;
              });
            },
            onStepCancel: () {
              setState(() {
                _stepCounter > 0
                    ? _stepCounter -= 1
                    : _stepCounter = _stepCounter;
              });
            },
            onStepContinue: () {
              setState(() {
                _stepCounter < (steps.length - 1)
                    ? _stepCounter += 1
                    : _stepCounter = _stepCounter;
              });
            },
          ),
        ),
      ),
    );
  }
}