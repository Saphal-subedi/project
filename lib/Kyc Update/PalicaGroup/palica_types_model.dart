import 'dart:convert';

PalicaType bloodGroupFromJson(String str) =>
    PalicaType.fromJson(json.decode(str));

String PalicaTypeToJson(PalicaType data) => json.encode(data.toJson());

class PalicaType {
  final String id;
  final String value;

  PalicaType({
    required this.id,
    required this.value,
  });

  factory PalicaType.fromJson(Map<String, dynamic> json) => PalicaType(
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
      };
}
