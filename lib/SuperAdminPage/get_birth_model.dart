// ignore_for_file: prefer_collection_literals, unnecessary_new

class GetBirth {
  String? id;
  String? fatherFullName;
  String? motherFullName;
  String? childFullName;

  GetBirth(
      {this.id, this.fatherFullName, this.motherFullName, this.childFullName});

  GetBirth.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fatherFullName = json['fatherFullName'];
    motherFullName = json['motherFullName'];
    childFullName = json['childFullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['fatherFullName'] = fatherFullName;
    data['motherFullName'] = motherFullName;
    data['childFullName'] = childFullName;
    return data;
  }
}
