import 'package:korean_lunar_utils/korean_lunar_utils.dart';
import 'package:test/test.dart';

void main() {
  group('LunarSolarConverter.convertLunarToSolar', () {
    test('장인어른 2019년', () {
      final lunar = DateTime(2019, 7, 14);

      final solar = LunarSolarConverter.convertLunarToSolar(lunar);

      expect(solar, DateTime(2019, 8, 14));
    });

    test('장인어른 2026년', () {
      final lunar = DateTime(2026, 7, 14);

      final solar = LunarSolarConverter.convertLunarToSolar(lunar);

      expect(solar, DateTime(2026, 8, 26));
    });

    test('장인어른 2020년', () {
      final lunar = DateTime(2020, 7, 14);

      final solar = LunarSolarConverter.convertLunarToSolar(lunar);

      expect(solar, DateTime(2020, 9, 1));
    });

    test('장인어른 2021년', () {
      final lunar = DateTime(2021, 7, 14);

      final solar = LunarSolarConverter.convertLunarToSolar(lunar);

      expect(solar, DateTime(2021, 8, 21));
    });

    test('장인어른 2022년', () {
      final lunar = DateTime(2022, 7, 14);

      final solar = LunarSolarConverter.convertLunarToSolar(lunar);

      expect(solar, DateTime(2022, 8, 11));
    });

    test('장모님 2019년', () {
      final lunar = DateTime(2019, 7, 5);

      final solar = LunarSolarConverter.convertLunarToSolar(lunar);

      expect(solar, DateTime(2019, 8, 5));
    });

    test('장모님 2020년', () {
      final lunar = DateTime(2020, 7, 5);

      final solar = LunarSolarConverter.convertLunarToSolar(lunar);

      expect(solar, DateTime(2020, 8, 23));
    });

    test('장모님 2021년', () {
      final lunar = DateTime(2021, 7, 5);

      final solar = LunarSolarConverter.convertLunarToSolar(lunar);

      expect(solar, DateTime(2021, 8, 12));
    });

    test('장모님 2022년', () {
      final lunar = DateTime(2022, 7, 5);

      final solar = LunarSolarConverter.convertLunarToSolar(lunar);

      expect(solar, DateTime(2022, 8, 2));
    });

    test('임의의 날짜', () {
      final lunar = DateTime(2025, 6, 23);

      final solar = LunarSolarConverter.convertLunarToSolar(lunar);

      expect(solar, DateTime(2025, 7, 17));
    });

    test('임의의 날짜2', () {
      final lunar = DateTime(2018, 11, 11);

      final solar = LunarSolarConverter.convertLunarToSolar(lunar);

      expect(solar, DateTime(2018, 12, 17));
    });

    test('임의의 날짜2', () {
      final lunar = DateTime(2024, 7, 14);

      final solar = LunarSolarConverter.convertLunarToSolar(lunar);

      expect(solar, DateTime(2024, 8, 17));
    });
  });
}
