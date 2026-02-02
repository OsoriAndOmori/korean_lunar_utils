import 'data/conversion_table.dart';
import 'lunar_calendar.dart';
import 'lunar_date.dart';

class LunarSolarConverter {
  LunarSolarConverter._();

  /// Converts a lunar date (non-leap month) to a solar date.
  static DateTime convertLunarToSolar(DateTime lunarDate) {
    final lunar = LunarDate.fromDateTime(lunarDate);
    return LunarCalendar.lunarToSolar(lunar);
  }

  /// Converts a solar date to a lunar date (leap month info omitted).
  static DateTime convertSolarToLunar(DateTime solarDate) {
    final lunar = LunarCalendar.solarToLunar(solarDate);
    return lunar.toDateKey().toDateTime();
  }

  /// Converts a lunar date (including leap month info) to a solar date.
  static DateTime convertLunarDateToSolar(LunarDate lunarDate) {
    return LunarCalendar.lunarToSolar(lunarDate);
  }

  /// Backwards-compatible alias for convertSolarToLunar.
  static DateTime converSolarToLunar(DateTime solarDate) {
    return convertSolarToLunar(solarDate);
  }

  /// Exposes generated conversion entries up to 2040.
  static List<ConversionEntry> get entries => ConversionTable.entries;
}
