import 'date_key.dart';

class LunarDate {
  const LunarDate(this.year, this.month, this.day, {this.isLeapMonth = false});

  final int year;
  final int month;
  final int day;
  final bool isLeapMonth;

  factory LunarDate.fromDateTime(DateTime date) {
    return LunarDate(date.year, date.month, date.day);
  }

  DateKey toDateKey() {
    return DateKey(year, month, day);
  }

  @override
  String toString() {
    final leapLabel = isLeapMonth ? ' (leap)' : '';
    return '$year-$month-$day$leapLabel';
  }
}
