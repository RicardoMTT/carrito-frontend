import 'package:intl/intl.dart';

Future<void> sleep(int milliseconds) async {
  await Future.delayed(Duration(milliseconds: milliseconds));
}

final applicationMonths = [
  'Enero',
  'Febrero',
  'Marzo',
  'Abril',
  'Mayo',
  'Junio',
  'Julio',
  'Agosto',
  'Setiembre',
  'Octubre',
  'Noviembre',
  'Diciembre',
];

final _ddMMyyyyhhmmssFormater = DateFormat('dd/MM/yyyy hh:mm:ss');
final _ddMMyyyyFormatter = DateFormat('dd/MM/yyyy');
final _ddMMyyFormatter = DateFormat('dd/MM/yy');
final _ddMMFormatter = DateFormat('dd/MM');
final _hhmmFormatter = DateFormat('hh:mm a');

DateTime parseDateTimeString(String dateTime) {
  return DateTime.parse(dateTime).toLocal();
}

String formatToDDMMYYYY(DateTime dateTime) {
  return _ddMMyyyyFormatter.format(dateTime);
}

String formatToDDMMYY(DateTime dateTime) {
  return _ddMMyyFormatter.format(dateTime);
}

String formatToDDMM(DateTime dateTime) {
  return _ddMMFormatter.format(dateTime);
}

String formatToDDMMYYhhmmss(DateTime dateTime) {
  return _ddMMyyyyhhmmssFormater.format(dateTime);
}

String formathhmma(DateTime dateTime) {
  return _hhmmFormatter.format(dateTime);
}

List<int> getPastYears(DateTime date) {
  final _year = date.year;
  final _pastYears = <int>[];
  int _pivotYear = 2020;
  while (_pivotYear <= _year) {
    _pastYears.add(_pivotYear);
    _pivotYear++;
  }
  return _pastYears;
}

List<String> getPastMonths(DateTime date, int year) {
  if (date.year > year) {
    return applicationMonths;
  }
  final _month = date.month;
  final _pastMonths = <String>[];
  int _monthIndex = 1;
  while (_monthIndex <= _month) {
    _pastMonths.add(applicationMonths[_monthIndex - 1]);
    _monthIndex++;
  }
  return _pastMonths;
}

bool isToday(DateTime date, [DateTime now]) {
  final _now = now ?? DateTime.now();
  return _now.day == date.day &&
      _now.month == date.month &&
      _now.year == date.year;
}

bool isYesterday(DateTime date, [DateTime yesterday]) {
  final _yesterday = yesterday ?? DateTime.now();
  return _yesterday.day == date.day &&
      _yesterday.month == date.month &&
      _yesterday.year == date.year;
}
