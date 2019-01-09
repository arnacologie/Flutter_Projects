import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    // Title
      title: "Simple Material App",
      // Home
      home: new MyHome()));
}

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => new MyHomeState();
}

class MyHomeState extends State<MyHome> {
  // init the step to 0th position
  int currentStep = 0;
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static final _padding = EdgeInsets.symmetric(vertical : 20.0);
  static String _name;
  static String _familyName;
  static String _day;
  static String _month;
  static String _year;
  static String _gender;
  static List<DropdownMenuItem> _unitMenuItems;
  final List<Step> mySteps = [
    new Step(
      // Title of the Step
        title: new Text("Saisissez votre nom"),
        // Content, it can be any widget here. Using basic Text for this example
        content: Container(
          padding: _padding,
          child: Form(
            key: _formKey,
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
    new Step(
        title: new Text("Informations générales"),
        content: Container(
          padding: _padding,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 100.0,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Jour',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (input){
                        if(input.isEmpty) return 'Entrez un jour';
                      },
                      style: TextStyle(fontSize: 20, color:Colors.black,),
                      onSaved: (text) => _day = text,
                    ),
                  ),
                  Container(
                    width: 100.0,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Année',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (input){
                        if(input.isEmpty) return 'Entrez une année';
                      },
                      style: TextStyle(fontSize: 20, color:Colors.black),
                      onSaved: (text) => _year = text,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        // You can change the style of the step icon i.e number, editing, etc.
        state: StepState.editing,
        isActive: true),
    new Step(
        title: new Text("Step 3"),
        content: new Text("Hello World!"),
        isActive: true),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createDropdownMenuItems();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // Appbar
      appBar: new AppBar(
        // Title
        title: new Text("Simple Material App"),
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
                      if(_formKey.currentState.validate()){
                        _formKey.currentState.save();
                        FocusScope.of(context).requestFocus(new FocusNode());
                        onStepContinue();
                        Scaffold.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(SnackBar(content: Text("Prénom : $_name, Nom : $_familyName"),));
                      }},
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
              });
              // Log function call
              print("onStepTapped : " + step.toString());
            },
            onStepCancel: () {
              setState(() {
                if (currentStep > 0) {
                  currentStep = currentStep - 1;
                } else {
                  currentStep = 0;
                }
              });
              print("onStepCancel : " + currentStep.toString());
            },
            onStepContinue: () {
              setState(() {
                if (currentStep < mySteps.length - 1) {
                  currentStep = currentStep + 1;
                } else {
                  currentStep = 0;
                }
              });
              // Log function call
              print("onStepContinue : " + currentStep.toString());
            },
          )),
    );
  }

  void _createDropdownMenuItems() {
    var newItems = <DropdownMenuItem>[];
    for(int i = 1; i<32; i++){
      newItems.add(DropdownMenuItem(
          value: i,
          child: Text(
            i.toString(),
            softWrap: true,
          )
      ));
    }

    setState(() {
      _unitMenuItems = newItems;
    });
  }

  Widget _createDropdown(String currentValue) {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      decoration: BoxDecoration(
        // This sets the color of the [DropdownButton] itself
        color: Colors.grey[50],
        border: Border.all(
          color: Colors.grey[400],
          width: 1.0,
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Theme(
        // This sets the color of the [DropdownMenuItem]
        data: Theme.of(context).copyWith(
          canvasColor: Colors.grey[50],
        ),
        child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton(
              value: currentValue,
              items: _unitMenuItems,
              style: Theme.of(context).textTheme.title,
            ),
          ),
        ),
      ),
    );
  }


}