
import 'dart:convert';

BloodGroup bloodGroupFromJson(String str) => BloodGroup.fromJson(json.decode(str));

String bloodGroupToJson(BloodGroup data) => json.encode(data.toJson());

class BloodGroup {
    final String id;
    final String value;

    BloodGroup({
        required this.id,
        required this.value,
    });

    factory BloodGroup.fromJson(Map<String, dynamic> json) => BloodGroup(
        id: json["id"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
    };
}