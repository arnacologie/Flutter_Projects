import 'dart:collection';

class Validator {

  static const _maxDayinMonth = {
    // Key:    Value
    'Janvier': 31,
    'Mars': 31,
    'Avril': 30,
    'Mai': 31,
    'Juin': 30,
    'Juillet': 31,
    'Août': 31,
    'Septembre': 30,
    'Octobre': 31,
    'Novembre': 30,
    'Décembre': 31,
  };


  static bool validateDate(String dayString, String monthString, String yearString){
    int day = int.parse(dayString);
    int year = int.parse(yearString);
    if(day > 0) {
      if (monthString != 'Février') {
        if (day <= _maxDayinMonth[monthString]) return true;
        return false;
      }
      if (_isLeapYear(year)) {
        if (day <= 29) {print('yes');return true;}
        return false;
      }
      if (day <= 28) return true;
      return false;
    }
    return false;
  }

  static bool _isLeapYear(int year){
    if(year%4==0 && year%100!=0) return true;
    else if(year%400==0) return true;
    return false;
  }
}

