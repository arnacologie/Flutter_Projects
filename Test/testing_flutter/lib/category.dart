import 'package:flutter/material.dart';

class Category extends StatelessWidget {

  final String text;
  final Color color;
  final IconData iconLocation;

  const Category({
    Key key,
    @required this.text,
    @required this.color,
    @required this.iconLocation,
  })  : assert(text != null),
        assert(color != null),
        assert(iconLocation != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: 100.0,
            child: InkWell(
              highlightColor: color,
              splashColor: color,
              borderRadius: BorderRadius.circular(50.0),
              onTap: () => print("I have been taped!"),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(iconLocation, size: 60),
                  ),
                  Center(
                    child: Text(
                      text,
                      style: Theme.of(context).textTheme.headline,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}

class CategoryList extends StatelessWidget {

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: createCategoryList()
    );
  }

  List<Widget> createCategoryList() {
    List<Widget> categoryList = List<Widget>();
    for(int i =0; i<_categoryNames.length; i++){
      Category category = Category(text: _categoryNames[i], color: _baseColors[i], iconLocation: Icons.cloud);
      categoryList.add(category);
      Color.fromARGB(a, r, g, b)
    }

    return categoryList;
  }
}
