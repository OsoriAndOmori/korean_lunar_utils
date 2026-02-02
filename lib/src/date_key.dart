class DateKey {
  const DateKey(this.year, this.month, this.day);

  final int year;
  final int month;
  final int day;

  factory DateKey.fromDateTime(DateTime date) {
    return DateKey(date.year, date.month, date.day);
  }

  DateTime toDateTime() {
    return DateTime(year, month, day);
  }

  @override
  bool operator ==(Object other) {
    return other is DateKey &&
        other.year == year &&
        other.month == month &&
        other.day == day;
  }

  @override
  int get hashCode => Object.hash(year, month, day);

  @override
  String toString() => '$year-$month-$day';
}
