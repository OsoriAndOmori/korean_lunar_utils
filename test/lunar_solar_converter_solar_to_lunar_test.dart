import 'package:korean_lunar_utils/korean_lunar_utils.dart';
import 'package:test/test.dart';

void main() {
  group('LunarSolarConverter.convertSolarToLunar', () {
    test('장인어른', () {
      final solar = DateTime(2019, 8, 14);

      final lunar = LunarSolarConverter.convertSolarToLunar(solar);

      expect(lunar, DateTime(2019, 7, 14));
    });

    test('장모님', () {
      final solar = DateTime(2019, 8, 5);

      final lunar = LunarSolarConverter.convertSolarToLunar(solar);

      expect(lunar, DateTime(2019, 7, 5));
    });

    test('미래 내 생일', () {
      final solar = DateTime(2020, 5, 3);

      final lunar = LunarSolarConverter.convertSolarToLunar(solar);

      expect(lunar, DateTime(2020, 6, 23));
    });

    test('미래 수진 생일', () {
      final solar = DateTime(2023, 8, 9);

      final lunar = LunarSolarConverter.convertSolarToLunar(solar);

      expect(lunar, DateTime(2023, 9, 23));
    });
  });
}
