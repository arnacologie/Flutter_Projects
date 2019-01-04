import 'package:flutter/material.dart';
import 'package:flutter_app_correction/unit.dart';

final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class Conversion extends StatelessWidget {
  final String name;
  final String subName;
  final ColorSwatch color;
  const Conversion({
    Key key,
    @required this.name,
    @required this.subName,
    @required this.color,
  })
      : assert(name != null),
        assert(subName != null),
        assert(color != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
        color: Colors.transparent,
        child: Container(
          height: _rowHeight,
          color: color,
          child: InkWell(
            //borderRadius: _borderRadius,
            //highlightColor: color,
            //splashColor: color,
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                  Text(
                    subName,
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
    ),
      );
  }
}

class ConverterRoute extends StatefulWidget{
  final String name;
  final List<Unit> units;
  final ColorSwatch color;
  const ConverterRoute({
    @required this.name,
    @required this.units,
    @required this.color
    }): assert(name != null),
        assert(units!=null),
        assert(color!=null);

  Widget _buildConversionWidgets(List<Widget> conversions) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => conversions[index],
      itemCount: conversions.length,
    );
  }

  @override
  State<StatefulWidget> createState() => ConverterRouteState();
}

class ConverterRouteState extends State<ConverterRoute>{
  @override
  Widget build(BuildContext context) {
    final conversions = <Conversion>[];

    for (var i = 0; i < widget.units.length; i++) {
      conversions.add(Conversion(
        name: widget.units[i].name,
        subName: 'Conversion: ${widget.units[i].conversion}',
        color: widget.color,
      ));
    }

    final listView = Container(
      color: Colors.white,
      child: widget._buildConversionWidgets(conversions),
    );

    return Scaffold(
      body: listView,
    );
  }

}