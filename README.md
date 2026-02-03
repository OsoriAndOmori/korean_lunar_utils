# korean_lunar_utils

Korean lunar/solar conversion utility with a structured converter API.

## 한국어

### 소개
`korean_lunar_utils`는 한국 음력/양력 변환을 위한 간단한 Dart 패키지입니다.

### 지원 범위
- 양력/음력 변환 범위: 1900-01-31 ~ 2049-12-31
- 윤달 정보가 필요할 경우 `LunarDate`를 사용하세요.

### 설치
```bash
dart pub add korean_lunar_utils
```

### 사용법
```dart
import 'package:korean_lunar_utils/korean_lunar_utils.dart';

// 음력 -> 양력 (윤달 정보 없음)
final solar = LunarSolarConverter.convertLunarToSolar(
  DateTime(2024, 7, 14),
);

// 양력 -> 음력 (윤달 정보 없음)
final lunar = LunarSolarConverter.convertSolarToLunar(
  DateTime(2024, 8, 17),
);

// 윤달 포함 음력 -> 양력
final solarFromLeap = LunarSolarConverter.convertLunarDateToSolar(
  const LunarDate(2020, 4, 1, isLeapMonth: true),
);
```

### API 요약
- `LunarSolarConverter.convertLunarToSolar(DateTime)`
- `LunarSolarConverter.convertSolarToLunar(DateTime)`
- `LunarSolarConverter.convertLunarDateToSolar(LunarDate)`
- `LunarSolarConverter.entries` (1900~2040 변환 테이블)

## English

### Overview
`korean_lunar_utils` is a lightweight Dart package for converting Korean lunar and solar dates.

### Supported Range
- Supported conversion range: 1900-01-31 through 2049-12-31
- Use `LunarDate` when you need leap-month (intercalary) information.

### Install
```bash
dart pub add korean_lunar_utils
```

### Usage
```dart
import 'package:korean_lunar_utils/korean_lunar_utils.dart';

// Lunar -> Solar (no leap-month info)
final solar = LunarSolarConverter.convertLunarToSolar(
  DateTime(2024, 7, 14),
);

// Solar -> Lunar (no leap-month info)
final lunar = LunarSolarConverter.convertSolarToLunar(
  DateTime(2024, 8, 17),
);

// Lunar with leap-month -> Solar
final solarFromLeap = LunarSolarConverter.convertLunarDateToSolar(
  const LunarDate(2020, 4, 1, isLeapMonth: true),
);
```

### API Summary
- `LunarSolarConverter.convertLunarToSolar(DateTime)`
- `LunarSolarConverter.convertSolarToLunar(DateTime)`
- `LunarSolarConverter.convertLunarDateToSolar(LunarDate)`
- `LunarSolarConverter.entries` (conversion table for 1900-2040)

## Publishing
This package is prepared for publishing to pub.dev. Run:

```bash
dart pub publish --dry-run
```
