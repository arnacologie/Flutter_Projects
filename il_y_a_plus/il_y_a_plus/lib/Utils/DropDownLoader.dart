import 'package:flutter/material.dart';

class DropDownLoader {

  static List<DropdownMenuItem> _monthItems;
  static List<DropdownMenuItem> _genderItems;
  static List<DropdownMenuItem> _schoolItems;
  static List<DropdownMenuItem> _gradeItems;

  static List<DropdownMenuItem> loadMonthItems() {
    _monthItems = List<DropdownMenuItem>();
    _monthItems.add(DropdownMenuItem(child: Text('Janvier'), value: 'Janvier'));
    _monthItems.add(DropdownMenuItem(child: Text('Février'), value: 'Février'));
    _monthItems.add(DropdownMenuItem(child: Text('Mars'), value: 'Mars'));
    _monthItems.add(DropdownMenuItem(child: Text('Avril'), value: 'Avril'));
    _monthItems.add(DropdownMenuItem(child: Text('Mai'), value: 'Mai'));
    _monthItems.add(DropdownMenuItem(child: Text('Juin'), value: 'Juin'));
    _monthItems.add(DropdownMenuItem(child: Text('Juillet'), value: 'Juillet'));
    _monthItems.add(DropdownMenuItem(child: Text('Août'), value: 'Août'));
    _monthItems.add(
        DropdownMenuItem(child: Text('Septembre'), value: 'Septembre'));
    _monthItems.add(DropdownMenuItem(child: Text('Octobre'), value: 'Octobre'));
    _monthItems.add(
        DropdownMenuItem(child: Text('Novembre'), value: 'Novembre'));
    _monthItems.add(
        DropdownMenuItem(child: Text('Décembre'), value: 'Décembre'));
    return _monthItems;
  }

  static List<DropdownMenuItem> loadGenderItems() {
    _genderItems = List<DropdownMenuItem>();
    _genderItems.add(DropdownMenuItem(child: Text('Femme'), value: 'Femme'));
    _genderItems.add(DropdownMenuItem(child: Text('Homme'), value: 'Homme'));
    return _genderItems;
  }

  static List<DropdownMenuItem> loadSchoolItems() {
    _schoolItems = List<DropdownMenuItem>();
    _schoolItems.add(DropdownMenuItem(child: Text('Ingésup'), value: 'Ingésup'));
    _schoolItems.add(DropdownMenuItem(child: Text('Création Design'), value: 'Création Design'));
    _schoolItems.add(DropdownMenuItem(child: Text('Animation 3D'), value: 'Animation 3D'));
    _schoolItems.add(DropdownMenuItem(child: Text('Web Marketing'), value: 'Web Marketing'));
    return _schoolItems;
  }

  static List<DropdownMenuItem> loadGradeItems() {
    _gradeItems = List<DropdownMenuItem>();
    _gradeItems.add(DropdownMenuItem(child: Text('B1'), value: 'B1'));
    _gradeItems.add(DropdownMenuItem(child: Text('B2'), value: 'B2'));
    _gradeItems.add(DropdownMenuItem(child: Text('B3'), value: 'B3'));
    _gradeItems.add(DropdownMenuItem(child: Text('M1'), value: 'M1'));
    _gradeItems.add(DropdownMenuItem(child: Text('M2'), value: 'M2'));
    return _gradeItems;
  }
}