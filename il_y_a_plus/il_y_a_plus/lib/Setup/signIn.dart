import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:il_y_a_plus/Pages/home.dart';
import 'package:il_y_a_plus/Pages/registration.dart';
import 'package:il_y_a_plus/Utils/CustomNavRoute.dart';

class LoginPage extends StatefulWidget{
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Connexion'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Container(
          //decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), border: Border.all(color: Colors.black)),
          //padding: const EdgeInsets.symmetric(vertical: 200.0, horizontal: 30.0),
          width: 325,
          height: 300,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Veuillez entrer votre email';
                      }
                    },
                    onSaved: (input) => _email = input,
                    decoration: InputDecoration(
                        labelText: 'Email'
                    ),
                  ),
                  TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Veuillez entrer votre email';
                      }
                    },
                    onSaved: (input) => _password = input,
                    decoration: InputDecoration(
                        labelText: 'Mot de passe'
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height:20.0),
                  RaisedButton(
                    onPressed: signIn,
                    child: Text('Se connecter',style: TextStyle(fontSize: 15.0, color: Colors.white),),
                    color: Colors.green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))
                  ),
                  RaisedButton(
                      onPressed: (){
                        Navigator.push(context, CustomNavRoute(
                            builder: (context) => RegistrationPage()));
                      },
                      child: Text('Je n\'ai pas de compte',style: TextStyle(fontSize: 15.0, color: Colors.white),),
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))
                  ),
                ],
              ),
            ),
          ),
      ),
      );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, CustomNavRoute(builder: (context) => Home(user: user,)));
      } catch (e) {
        print(e.message);
      }
    }
  }

}
