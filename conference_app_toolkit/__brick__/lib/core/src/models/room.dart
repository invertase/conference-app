import 'package:freezed_annotation/freezed_annotation.dart';

part 'room.freezed.dart';
part 'room.g.dart';

@freezed
class Room with _$Room {
  const factory Room({
    required int id,
    required String name,
    required int sort,
    String? image,
  }) = _Room;

  factory Room.fromJson(Map<String, Object?> json) => _$RoomFromJson(json);
}
