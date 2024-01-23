import 'dart:convert';

DocumentGroup bloodGroupFromJson(String str) =>
    DocumentGroup.fromJson(json.decode(str));

String DocumentGroupToJson(DocumentGroup data) => json.encode(data.toJson());

class DocumentGroup {
  final String id;
  final String value;

  DocumentGroup({
    required this.id,
    required this.value,
  });

  factory DocumentGroup.fromJson(Map<String, dynamic> json) => DocumentGroup(
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
      };
}
