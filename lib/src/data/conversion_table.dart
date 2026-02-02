import '../date_key.dart';
import '../lunar_calendar.dart';
import '../lunar_date.dart';

class ConversionEntry {
  const ConversionEntry({required this.lunar, required this.solar});

  final LunarDate lunar;
  final DateKey solar;
}

class ConversionTable {
  ConversionTable._();

  static const int startYear = 1900;
  static const int endYear = 2040;

  static final List<ConversionEntry> entries = _buildEntries();

  static List<ConversionEntry> _buildEntries() {
    final generated = <ConversionEntry>[];
    for (var year = startYear; year <= endYear; year++) {
      final leapMonth = LunarCalendar.leapMonthOfYear(year);
      for (var month = 1; month <= 12; month++) {
        _addMonth(generated, year, month, false);
        if (leapMonth == month) {
          _addMonth(generated, year, month, true);
        }
      }
    }
    return generated;
  }

  static void _addMonth(
    List<ConversionEntry> entries,
    int year,
    int month,
    bool isLeap,
  ) {
    final days = isLeap
        ? LunarCalendar.leapMonthDays(year)
        : LunarCalendar.monthDays(year, month);
    for (var day = 1; day <= days; day++) {
      final lunar = LunarDate(year, month, day, isLeapMonth: isLeap);
      final solar = DateKey.fromDateTime(LunarCalendar.lunarToSolar(lunar));
      entries.add(ConversionEntry(lunar: lunar, solar: solar));
    }
  }
}
