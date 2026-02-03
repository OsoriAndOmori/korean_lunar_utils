import 'package:korean_lunar_utils/korean_lunar_utils.dart';
import 'package:test/test.dart';

void main() {
  group('LunarSolarConverter.convertSolarToLunar', () {
    final cases = <Map<String, DateTime>>[
      {
        'solar': DateTime(2019, 8, 14),
        'lunar': DateTime(2019, 7, 14),
      },
      {
        'solar': DateTime(2019, 8, 5),
        'lunar': DateTime(2019, 7, 5),
      },
      {
        'solar': DateTime(2020, 5, 3),
        'lunar': DateTime(2020, 4, 11),
      },
      {
        'solar': DateTime(2023, 8, 9),
        'lunar': DateTime(2023, 6, 23),
      },
    ];

    for (final testCase in cases) {
      final solar = testCase['solar']!;
      final lunar = testCase['lunar']!;

      test('양력 $solar -> 음력 $lunar', () {
        expect(
          LunarSolarConverter.convertSolarToLunar(solar),
          lunar,
        );
      });
    }
  });

  group('LunarSolarConverter.convertSolarToLunar range validation', () {
    test('지원 범위 이전 날짜는 예외', () {
      expect(
        () => LunarSolarConverter.convertSolarToLunar(DateTime(1899, 12, 31)),
        throwsRangeError,
      );
    });

    test('지원 범위 이후 날짜는 예외', () {
      expect(
        () => LunarSolarConverter.convertSolarToLunar(DateTime(2050, 2, 1)),
        throwsRangeError,
      );
    });
  });
}
