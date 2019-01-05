import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rainbow Circle',
      home: Scaffold(
          backgroundColor: Colors.blue[100],
          body: RainbowCircle()),
    ),
  );
}

class RainbowCircle extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => RainbowCircleState();
}

class RainbowCircleState extends State<RainbowCircle>{
  Color _color1 = _generateColor();
  Color _color2 = _generateColor();

  @override
  Widget build(BuildContext context) {

    return Center(
        child: Container(
            width: 600,
            height: 850,
            child: FlatButton(
              onPressed: (){
                setState(() {
                  _color1 = _color2;
                  _color2 = _generateColor();
                });
              },
              color: _color1,
              splashColor: _color2,
              child: Text('Rainbow Button', style: TextStyle(fontSize: 35),)
            )
        )
    );
  }

  static Color _generateColor() {
    Random rand = Random();
    int red = rand.nextInt(256);
    int green = rand.nextInt(256);
    int blue = rand.nextInt(256);
    print('Red: $red, Green: $green, Blue: $blue');
    return Color.fromRGBO(red, green, blue, 1.0);
  }

}
