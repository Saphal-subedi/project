import 'dart:convert';

RelationType bloodGroupFromJson(String str) =>
    RelationType.fromJson(json.decode(str));

String PalicaTypeToJson(RelationType data) => json.encode(data.toJson());

class RelationType {
  final String id;
  final String value;

  RelationType({
    required this.id,
    required this.value,
  });

  factory RelationType.fromJson(Map<String, dynamic> json) => RelationType(
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
      };
}
