import 'package:health/health.dart';

final types = [
  HealthDataType.STEPS,
  HealthDataType.SLEEP_IN_BED,
  HealthDataType.SLEEP_ASLEEP,
  HealthDataType.SLEEP_AWAKE,
  HealthDataType.SLEEP_DEEP,
  HealthDataType.SLEEP_REM,
];

// 'The length of [types] must be same as that of [permissions].'
// typesリストとpermissionsリストが同じ長さでないとエラーになるため対応
final permissions = types.map((e) => HealthDataAccess.READ).toList();
