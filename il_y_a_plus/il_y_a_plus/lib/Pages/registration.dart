import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget{

  @override
    State<StatefulWidget> createState() => RegistrationPageState();
  }

class RegistrationPageState extends State<RegistrationPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Inscription')),
      body: Center(
        child: Container(
          child : Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Veuillez entrer votre email';
                  }
                },
                //onSaved: (input) => _email = input,
                decoration: InputDecoration(
                    labelText: 'Email'
                ),
              ),
            ],
          )
        ),
      ),
    );
}
}