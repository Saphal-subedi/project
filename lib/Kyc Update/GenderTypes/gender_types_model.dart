import 'dart:convert';

GenderType bloodGroupFromJson(String str) =>
    GenderType.fromJson(json.decode(str));

String bloodGroupToJson(GenderType data) => json.encode(data.toJson());

class GenderType {
  final String id;
  final String value;

  GenderType({
    required this.id,
    required this.value,
  });

  factory GenderType.fromJson(Map<String, dynamic> json) => GenderType(
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
      };
}
