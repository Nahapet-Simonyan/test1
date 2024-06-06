import 'package:hive_flutter/hive_flutter.dart';
import 'package:test1/core/constants/storage.dart';

part 'enums.g.dart';

@HiveType(typeId: AppStorage.enumMoodTypeId)
enum MoodType {
  @HiveField(0)
  joy,
  @HiveField(1)
  fear,
  @HiveField(2)
  rabies,
  @HiveField(3)
  sadness,
  @HiveField(4)
  calmness,
  @HiveField(5)
  force
}
