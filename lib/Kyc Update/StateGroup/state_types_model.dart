import 'dart:convert';

StateType bloodGroupFromJson(String str) =>
    StateType.fromJson(json.decode(str));

String PalicaTypeToJson(StateType data) => json.encode(data.toJson());

class StateType {
  final String id;
  final String value;

  StateType({
    required this.id,
    required this.value,
  });

  factory StateType.fromJson(Map<String, dynamic> json) => StateType(
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
      };
}
