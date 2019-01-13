import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:il_y_a_plus/Utils/Validator.dart';

class RegistrationPage extends StatefulWidget {
  @override
  RegistrationPageState createState() => new RegistrationPageState();
}

class RegistrationPageState extends State<RegistrationPage> {
  // init the step to 0th position
  int currentStep = 0;
  static final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  static final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  static final GlobalKey<FormState> _formKey3= GlobalKey<FormState>();
  static  GlobalKey<FormState> currentFormKey = _formKey1;
  static final List<GlobalKey<FormState>> formKeys = List<GlobalKey<FormState>>();
  static final _padding = EdgeInsets.symmetric(vertical : 20.0);
  static String _name;
  static String _familyName;
  static String _day;
  static String _month = 'Janvier';
  static String _year;
  static String _gender = 'Femme';
  static String _nickname;
  static String _password;
  static String _confirmPassword;
  static List<DropdownMenuItem> _unitMenuItems;
  static List<DropdownMenuItem> monthItems;
  static List<DropdownMenuItem> genderItems;
  static String monthValue = 'Janvier';
  static String genderValue = 'Femme';
  static bool isDateWrong = false;
  static bool passwordsNoMatch = false;
  List<Step> get mySteps => [
    Step(
      // Title of the Step
        title : Text("Saisissez votre nom"),
        // Content, it can be any widget here. Using basic Text for this example
        content: Container(
          padding: _padding,
          child: Form(
            key: _formKey1,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (input){
                    if(input.isEmpty) return 'Entrez votre prénom';
                  },
                  style: TextStyle(fontSize: 20, color:Colors.black),
                  onSaved: (text) => _name = text,
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nom',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (input){
                    if(input.isEmpty) return 'Entrez votre nom';
                  },
                  style: TextStyle(fontSize: 20, color:Colors.black),
                  onSaved: (text) => _familyName = text,
                ),
              ],
            ),
          ),
        ),
        isActive: true),
    Step(
        title: Text("Informations générales"),
        subtitle: Text("Saisissez votre de date de naissance et votre sexe."),
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical:8.0),
          child: Form(
            key: _formKey2,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Jour',
                          counterText: '',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (input){
                          if(input.isEmpty) return 'Entrez un jour';
                          if(isDateWrong) {isDateWrong = false; return 'Entrez un jour valide';}
                        },
                        maxLength: 2,
                        style: TextStyle(fontSize: 20, color:Colors.black,),
                        onSaved: (text) => _day = text,
                      ),
                    ),
                    SizedBox(width: 50.0,),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Année',
                          counterText: '',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (input){
                          if(input.isEmpty) return 'Entrez une année';
                        },
                        style: TextStyle(fontSize: 20, color:Colors.black),
                        maxLength: 4,
                        maxLengthEnforced: true,
                        onSaved: (text) => _year = text,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color :Colors.black54),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton(
                            value: monthValue,
                            items: loadMonthItems(),
                            onChanged: (newValue){
                              setState(() {
                                monthValue = newValue;
                                _month = newValue;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color :Colors.black54),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton(
                            value: genderValue,
                            items: loadGenderItems(),
                            onChanged: (newValue){
                              setState(() {
                                genderValue = newValue;
                                _gender = newValue;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25.0,)
              ],
            ),
          ),
        ),
        // You can change the style of the step icon i.e number, editing, etc.
        state: StepState.editing,
        isActive: true),
    Step(
        title: Text("Informations de connexion"),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key: _formKey3,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Nom d\'utilisateur',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        )
                    ),
                    validator: (input){
                      //TODO check with Firebase if already taken
                      if(input.isEmpty) return 'Veuillez choisir un nom d\'utilisateur';
                    },
                    onSaved: (text) => _nickname = text,
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Créez un mot de passe',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        )
                    ),
                    validator: (input){
                      if(input.isEmpty) return 'Veuillez saisir un mot de passe';
                    },
                    onSaved: (text) => _password = text,
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Confirmer',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        )
                    ),
                    validator: (input){
                      if(input.isEmpty) return 'Veuillez confirmer le mot de passe';
                      if(passwordsNoMatch) {passwordsNoMatch = false; return 'Les mots de passe ne correspondent pas.';}
                    },
                    onSaved: (text) => _confirmPassword = text,
                  ),
                ],
              )
          ),
        ),
        isActive: true),
  ];

  static List<DropdownMenuItem> loadMonthItems(){
    monthItems = List<DropdownMenuItem>();
    monthItems.add(DropdownMenuItem(child: Text('Janvier'), value: 'Janvier'));
    monthItems.add(DropdownMenuItem(child: Text('Février'), value: 'Février'));
    monthItems.add(DropdownMenuItem(child: Text('Mars'), value: 'Mars'));
    monthItems.add(DropdownMenuItem(child: Text('Avril'), value: 'Avril'));
    monthItems.add(DropdownMenuItem(child: Text('Mai'), value: 'Mai'));
    monthItems.add(DropdownMenuItem(child: Text('Juin'), value: 'Juin'));
    monthItems.add(DropdownMenuItem(child: Text('Juillet'), value: 'Juillet'));
    monthItems.add(DropdownMenuItem(child: Text('Août'), value: 'Août'));
    monthItems.add(DropdownMenuItem(child: Text('Septembre'), value: 'Septembre'));
    monthItems.add(DropdownMenuItem(child: Text('Octobre'), value: 'Octobre'));
    monthItems.add(DropdownMenuItem(child: Text('Novembre'), value: 'Novembre'));
    monthItems.add(DropdownMenuItem(child: Text('Décembre'), value: 'Décembre'));
    return monthItems;
  }

  static List<DropdownMenuItem> loadGenderItems(){
    genderItems = List<DropdownMenuItem>();
    genderItems.add(DropdownMenuItem(child: Text('Femme'), value: 'Femme'));
    genderItems.add(DropdownMenuItem(child: Text('Homme'), value: 'Homme'));
    return genderItems;
  }

  //TODO disable on step click is not secure enough
  void createAccount() async {
    if(_name!=null&&_familyName!=null&&_day!=null&&_month!=null&&_year!=null&&_gender!=null&&_nickname!=null&&_password!=null&&_confirmPassword!=null){
      String email = '${_name.toLowerCase()}.${_familyName.toLowerCase()}@ynov.com';
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: _password);
        //user.sendEmailVerification();
        Navigator.of(context).pop();
      }catch(e){
        print(e.message);
      }
    }
  }

  void validateForms(BuildContext context, VoidCallback onStepContinue, VoidCallback onStepCancel){
    if(currentFormKey.currentState.validate()){
      if(currentFormKey == _formKey2){
        currentFormKey.currentState.save();
        print('DATE $_day, $_month,  $_year, $_gender');
        if(Validator.validateDate(_day, _month, _year)){
          onStepContinue();
          Scaffold.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text("Jour : $_day, Mois : $_month, Annee : $_year"),));
        }
        else isDateWrong = true;
      }
      else if(currentFormKey == _formKey3){
        currentFormKey.currentState.save();
        if(_password == _confirmPassword){
          onStepContinue();
          Scaffold.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text("Votre compte vient d'être créé")),);
        }
        else passwordsNoMatch = true;
      }
      else{
        currentFormKey.currentState.save();
        //FocusScope.of(context).requestFocus(new FocusNode());
        onStepContinue();
        Scaffold.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text("Prénom : $_name, Nom : $_familyName, Mois : $_month, Annee : $_year, User : $_nickname"),));
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    formKeys.add(_formKey1);
    formKeys.add(_formKey2);
    formKeys.add(_formKey3);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // Appbar
      appBar: new AppBar(
        // Title
        title: new Text("Créer un compte"),
      ),
      // Body
      body: new Container(
          child: new Stepper(
            // Using a variable here for handling the currentStep
            currentStep: this.currentStep,
            controlsBuilder: (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
              return Row(
                children: <Widget>[
                  Container(
                    child: FlatButton(onPressed: (){
                      //hide the keyboard
                      validateForms(context, onStepContinue, onStepCancel);
                    },
                      child: Text('Continuer', style:TextStyle(color: Colors.white)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Container(
                    child: FlatButton(onPressed: onStepCancel,
                      child: Text('Annuler', style:TextStyle(color: Colors.white)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      color: Colors.grey,
                    ),
                  ),
                ],
              );
            },
            steps: mySteps,
            type: StepperType.vertical,
            onStepTapped: (step) {
              setState(() {
                currentStep = step;
                currentFormKey = formKeys[step];
              });
              // Log function call
              print("onStepTapped : " + step.toString());
            },
            onStepCancel: () {
              setState(() {
                if (currentStep > 0) {
                  currentStep = currentStep - 1;
                  currentFormKey = formKeys[currentStep];
                } else {
                  currentStep = 0;
                  currentFormKey = formKeys[currentStep];
                }
              });
              print("onStepCancel : " + currentStep.toString());
            },
            onStepContinue: () {
              setState(() {
                if (currentStep < mySteps.length - 1) {
                  currentStep = currentStep + 1;
                  currentFormKey = formKeys[currentStep];
                }
                else if(currentStep == mySteps.length-1){
                  createAccount();
                }
                else {
                  currentStep = 0;
                  currentFormKey = formKeys[currentStep];
                }
              });
              // Log function call
              print("onStepContinue : " + currentStep.toString());

            },
          )),
    );
  }
}