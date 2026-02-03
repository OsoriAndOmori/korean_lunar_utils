import 'package:korean_lunar_utils/korean_lunar_utils.dart';
import 'package:test/test.dart';

void main() {
  group('LunarSolarConverter.convertLunarToSolar', () {
    final cases = <Map<String, DateTime>>[
      {
        'lunar': DateTime(2019, 7, 14),
        'solar': DateTime(2019, 8, 14),
      },
      {
        'lunar': DateTime(2026, 7, 14),
        'solar': DateTime(2026, 8, 26),
      },
      {
        'lunar': DateTime(2020, 7, 14),
        'solar': DateTime(2020, 9, 1),
      },
      {
        'lunar': DateTime(2021, 7, 14),
        'solar': DateTime(2021, 8, 21),
      },
      {
        'lunar': DateTime(2022, 7, 14),
        'solar': DateTime(2022, 8, 11),
      },
      {
        'lunar': DateTime(2019, 7, 5),
        'solar': DateTime(2019, 8, 5),
      },
      {
        'lunar': DateTime(2020, 7, 5),
        'solar': DateTime(2020, 8, 23),
      },
      {
        'lunar': DateTime(2021, 7, 5),
        'solar': DateTime(2021, 8, 12),
      },
      {
        'lunar': DateTime(2022, 7, 5),
        'solar': DateTime(2022, 8, 2),
      },
      {
        'lunar': DateTime(2025, 6, 23),
        'solar': DateTime(2025, 7, 17),
      },
      {
        'lunar': DateTime(2018, 11, 11),
        'solar': DateTime(2018, 12, 17),
      },
      {
        'lunar': DateTime(2024, 7, 14),
        'solar': DateTime(2024, 8, 17),
      },
    ];

    for (final testCase in cases) {
      final lunar = testCase['lunar']!;
      final solar = testCase['solar']!;

      test('음력 $lunar -> 양력 $solar', () {
        expect(
          LunarSolarConverter.convertLunarToSolar(lunar),
          solar,
        );
      });
    }
  });

  group('LunarSolarConverter.convertLunarToSolar range validation', () {
    test('지원 범위 이전 연도는 예외', () {
      expect(
        () => LunarSolarConverter.convertLunarToSolar(DateTime(1899, 12, 1)),
        throwsRangeError,
      );
    });

    test('지원 범위 이후 연도는 예외', () {
      expect(
        () => LunarSolarConverter.convertLunarToSolar(DateTime(2050, 1, 1)),
        throwsRangeError,
      );
    });
  });
}
