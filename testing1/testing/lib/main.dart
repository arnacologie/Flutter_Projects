import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    final title = 'Grid List';
    final interests = ['Front Web', 'Back Web', 'Mobile' ,'Jeu Vidéo', 'Réseau', 'Sécurité'];
    final colorBox = [Color(0xFF4c86c6), Color(0xFFee3c4c),Color(0xFFf47e54), Color(0xFF4ebc97), Color(0xFF23334a), Color(0xFF9C27B0)];
    bool _visible = false;
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this would produce 2 rows.
          crossAxisCount: 2,
          // Generate 100 Widgets that display their index in the List
          children: List.generate(interests.length, (index) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: FlatButton(
                color: colorBox[index],
                onPressed: (){
                  setState(() {
                    _visible = !_visible;
                  });
                },
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color:Colors.transparent),
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: Center(
                        child: Text(
                          '${interests[index]}',
                          style: TextStyle(fontFamily: 'Montserrat', fontSize: 23, fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                      ),
                    ),
                    Align(child: Opacity(
                        opacity: _visible ? 1.0 : 0.0,
                        child: Icon(Icons.check, color: Colors.white, size: 50,)), alignment: AlignmentDirectional(1.25, 1),)
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

}