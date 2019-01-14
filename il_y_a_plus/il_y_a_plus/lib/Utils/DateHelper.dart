import 'dart:collection';

class DateHelper {

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

  static const _monthList = {
    // Key:    Value
    'Janvier': "01",
    'Février': "02",
    'Mars': "03",
    'Avril': "04",
    'Mai': "05",
    'Juin': "06",
    'Juillet': "07",
    'Août': "08",
    'Septembre': "09",
    'Octobre': "10",
    'Novembre': "11",
    'Décembre': "12",
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

  static String convertDateforDB(String day, String month, String year){
    String monthFormatted;
    if(_monthList.containsKey(month)){
      monthFormatted = _monthList[month].toString();
    }
    return '$day/$monthFormatted/$year';
  }
}

