import 'package:freezed_annotation/freezed_annotation.dart';

part 'day.freezed.dart';
part 'day.g.dart';

@freezed
class Day with _$Day {
  const factory Day({
    required DateTime date,
    required String name,
  }) = _Day;

  factory Day.fromJson(Map<String, Object?> json) => _$DayFromJson(json);
}
