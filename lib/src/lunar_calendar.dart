import 'data/lunar_calendar_data.dart';
import 'date_key.dart';
import 'lunar_date.dart';

class LunarCalendar {
  LunarCalendar._();

  static const int _baseYear = LunarCalendarData.startYear;
  static final DateTime _baseDate = LunarCalendarData.baseDate;

  static DateTime lunarToSolar(LunarDate lunar) {
    _assertYearInRange(lunar.year);

    var offset = 0;
    for (var year = _baseYear; year < lunar.year; year++) {
      offset += _lunarYearDays(year);
    }

    final leapMonth = leapMonthOfYear(lunar.year);
    for (var month = 1; month < lunar.month; month++) {
      offset += monthDays(lunar.year, month);
      if (leapMonth == month) {
        offset += leapMonthDays(lunar.year);
      }
    }

    if (lunar.isLeapMonth) {
      if (leapMonth != lunar.month) {
        throw RangeError('Year ${lunar.year} does not have leap month ${lunar.month}.');
      }
      offset += monthDays(lunar.year, lunar.month);
    }

    offset += lunar.day - 1;

    return _baseDate.add(Duration(days: offset));
  }

  static LunarDate solarToLunar(DateTime solar) {
    if (solar.isBefore(_baseDate)) {
      throw RangeError('Solar date must be on or after $_baseDate.');
    }

    var offset = solar.difference(_baseDate).inDays;
    var year = _baseYear;
    while (year <= LunarCalendarData.endYear) {
      final yearDays = _lunarYearDays(year);
      if (offset < yearDays) {
        break;
      }
      offset -= yearDays;
      year++;
    }

    _assertYearInRange(year);

    final leapMonth = leapMonthOfYear(year);
    var isLeap = false;
    var month = 1;
    while (month <= 12) {
      final daysInMonth = isLeap
          ? leapMonthDays(year)
          : monthDays(year, month);
      if (offset < daysInMonth) {
        break;
      }
      offset -= daysInMonth;

      if (leapMonth == month && !isLeap) {
        isLeap = true;
      } else {
        if (isLeap) {
          isLeap = false;
          month++;
        } else {
          month++;
        }
      }
    }

    final day = offset + 1;
    return LunarDate(year, month, day, isLeapMonth: isLeap);
  }

  static int monthDays(int year, int month) {
    final info = _yearInfo(year);
    return (info & (0x10000 >> month)) == 0 ? 29 : 30;
  }

  static int leapMonthDays(int year) {
    final leapMonth = leapMonthOfYear(year);
    if (leapMonth == 0) {
      return 0;
    }
    return (_yearInfo(year) & 0x10000) == 0 ? 29 : 30;
  }

  static int leapMonthOfYear(int year) {
    return _yearInfo(year) & 0xf;
  }

  static int _lunarYearDays(int year) {
    var sum = 348;
    final info = _yearInfo(year);
    for (var mask = 0x8000; mask > 0x8; mask >>= 1) {
      if ((info & mask) != 0) {
        sum++;
      }
    }
    return sum + leapMonthDays(year);
  }

  static int _yearInfo(int year) {
    final index = year - _baseYear;
    if (index < 0 || index >= LunarCalendarData.lunarInfo.length) {
      throw RangeError('Year $year is out of supported range.');
    }
    return LunarCalendarData.lunarInfo[index];
  }

  static void _assertYearInRange(int year) {
    if (year < LunarCalendarData.startYear ||
        year > LunarCalendarData.endYear) {
      throw RangeError(
          'Year $year is out of supported range ${LunarCalendarData.startYear}-${LunarCalendarData.endYear}.');
    }
  }
}
