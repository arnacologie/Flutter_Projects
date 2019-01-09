import 'package:flutter/material.dart';
import 'package:il_y_a_plus/Setup/signIn.dart';

void main() => runApp(IlyaplusApp());

class IlyaplusApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Il y a plus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }

}



