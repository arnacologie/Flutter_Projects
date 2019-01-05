// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'unit.dart';

const _padding = EdgeInsets.all(16.0);

/// [ConverterRoute] where users can input amounts to convert in one [Unit]
/// and retrieve the conversion in another [Unit] for a specific [Category].
///
/// While it is named ConverterRoute, a more apt name would be ConverterScreen,
/// because it is responsible for the UI at the route's destination.
class ConverterRoute extends StatefulWidget {
  /// This [Category]'s name.
  final String name;

  /// Color for this [Category].
  final Color color;

  /// Units for this [Category].
  final List<Unit> units;

  /// This [ConverterRoute] requires the name, color, and units to not be null.
  const ConverterRoute({
    @required this.name,
    @required this.color,
    @required this.units,
  })  : assert(name != null),
        assert(color != null),
        assert(units != null);

  @override
  _ConverterRouteState createState() => _ConverterRouteState();
}

class _ConverterRouteState extends State<ConverterRoute> {
  // TODO: Set some variables, such as for keeping track of the user's input
  // value and units
  bool isTextValid = true;

  // TODO: Determine whether you need to override anything, such as initState()

  // TODO: Add other helper functions. We've given you one, _format()

  /// Clean up conversion; trim trailing zeros, e.g. 5.500 -> 5.5, 10.0 -> 10
  String _format(double conversion) {
    var outputNum = conversion.toStringAsPrecision(7);
    if (outputNum.contains('.') && outputNum.endsWith('0')) {
      var i = outputNum.length - 1;
      while (outputNum[i] == '0') {
        i -= 1;
      }
      outputNum = outputNum.substring(0, i + 1);
    }
    if (outputNum.endsWith('.')) {
      return outputNum.substring(0, outputNum.length - 1);
    }
    return outputNum;
  }

  void _isNumeric(String str) {
    if(str == null) {
      isTextValid = false;
    }
    isTextValid = double.tryParse(str) != null;
    print(isTextValid.toString());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Create the 'input' group of widgets. This is a Column that
    // includes the input value, and 'from' unit [Dropdown].
    final input = Padding(
        padding: _padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              style: Theme
                  .of(context)
                  .textTheme
                  .display1,
              decoration: InputDecoration(
                  labelText: 'Input',
                  labelStyle: Theme
                      .of(context)
                      .textTheme
                      .display1,
                  border: OutlineInputBorder(),
                errorText: isTextValid ? null : 'Veuillez entrer un nombre valide.',
              ),
              onChanged: (text){
                _isNumeric(text);
              },
            ),
            Container(
              margin: EdgeInsets.only(top:10),
              padding: _padding,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  elevation: 0,
                  items: dropdownOptions(),
                  onChanged: (_) {},
                  style: Theme.of(context).textTheme.title,
                ),
              ),
            ),
          ],
        )
    );

    final arrows = RotatedBox(
      quarterTurns: 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: (){},
        child: Icon(
          Icons.compare_arrows,
          size: 40.0,),
      ),

    );

    final output = Padding(
        padding: _padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              style: Theme
                  .of(context)
                  .textTheme
                  .display1,
              decoration: InputDecoration(
                  labelText: 'Output',
                  labelStyle: Theme
                      .of(context)
                      .textTheme
                      .display1,
                  border: OutlineInputBorder()
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:10),
              padding: _padding,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).primaryColor
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  elevation: 0,
                  items: dropdownOptions(),
                  onChanged: (_) {},
                  style: Theme.of(context).textTheme.title,
                ),
              ),
            ),
          ],
        )
    );

    final display = Padding(
      padding: _padding,
      child : Column(
        children: [
          input,
          arrows,
          output,
        ],
      )
    );

    final unitWidgets = widget.units.map((Unit unit) {
      return Container(
        color: widget.color,
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              unit.name,
              style: Theme.of(context).textTheme.headline,
            ),
            Text(
              'Conversion: ${unit.conversion}',
              style: Theme.of(context).textTheme.subhead,
            ),
          ],
        ),
      );
    }).toList();

    /*ListView(
      children: unitWidgets,
    );*/



    return display;
  }

  List<DropdownMenuItem> dropdownOptions() {
    List<DropdownMenuItem> dropdownOptions = List<DropdownMenuItem>();
    for (int i = 0; i<widget.units.length; i++){
      dropdownOptions.add(DropdownMenuItem(
          child: Text(
          '${widget.name} Unit ${i+1}'
      ),
      ));
    }
    return dropdownOptions;
  }

}