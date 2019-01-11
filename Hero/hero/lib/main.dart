import 'package:flutter/material.dart';
import 'package:hero/CustomNavRoute.dart';
import 'package:hero/inheritedWidget.dart';

void main() => runApp(App());

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }

}

class MainScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => MainState();

}

class MainState extends State<MainScreen>{
  bool visible = true;
  final myController = TextEditingController();
  List<DropdownMenuItem<int>> items;

  @override
  Widget build(BuildContext context) {
    load();
    return Scaffold(
      appBar: AppBar(title: Text('Main screen')),
      body: Center(child: Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 150.0,
              child: Hero(
                tag:'textHero',
                child: Material(
                  color: Colors.transparent,
                  child: TextField(
                    controller: myController,
                    style: Theme.of(context).textTheme.display1,
                    decoration: InputDecoration(
                        labelText: "Ton text",
                        labelStyle: Theme.of(context).textTheme.display1,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)
                        )
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            SelectionButton(),
            SizedBox(height: 20,),
            DropdownButton(
              onChanged: (_) {},
              items: items,
            )
        ],
        ),
      ),),
    );
  }
  void load(){
    items = List<DropdownMenuItem<int>>();
    items.add(DropdownMenuItem(child: Text('A'), value: 1,));
    items.add(DropdownMenuItem(child: Text('B'), value: 2,));
    items.add(DropdownMenuItem(child: Text('C'), value: 3,));
  }
}

class SelectionButton extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed:(){
        _navigateAndDisplaySelection(context);
      },
      child:  Text('Choisis une option, n\'importe laquelle !'),
    );
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(context, CustomNavRoute(builder: (context) => SelectionScreen()));

    if(result!=null) {
      Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("$result"),
            RaisedButton(
              onPressed: (){Scaffold.of(context).hideCurrentSnackBar();},
              child: Text('OK',
                style: TextStyle(color: Colors.black)),
                color: Colors.white,)
          ],
        ), ));
    }
  }
}



class SelectionScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => SelectionScreenState();
}

class SelectionScreenState extends State<SelectionScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Selection Screen'),),
        body: Center(
          child: Container(
            width: 300.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag:'textHero',
                  child: Material(
                    color: Colors.transparent,
                    child: TextField(
                      style: Theme.of(context).textTheme.display1,
                      decoration: InputDecoration(
                          labelText: "Ton text",
                          labelStyle: Theme.of(context).textTheme.display1,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)
                          )
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: RaisedButton(
                      onPressed: (){
                        Navigator.pop(context,'Yep!');
                      },
                      child: Text('Yep')),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: RaisedButton(
                      onPressed: (){
                        Navigator.pop(context,'Nope.');
                      },
                      child: Text('Nope.')),
                ),
              ],
            ),
          ),
        )
    );
  }

}

