class GetDeath {
  String? id;
  String? personFullName;
  String? placeOfDeath;
  String? causeOfDeath;
  String? deathTime;

  GetDeath(
      {this.id,
      this.personFullName,
      this.placeOfDeath,
      this.causeOfDeath,
      this.deathTime});

  GetDeath.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    personFullName = json['personFullName'];
    placeOfDeath = json['placeOfDeath'];
    causeOfDeath = json['causeOfDeath'];
    deathTime = json['deathTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['personFullName'] = this.personFullName;
    data['placeOfDeath'] = this.placeOfDeath;
    data['causeOfDeath'] = this.causeOfDeath;
    data['deathTime'] = this.deathTime;
    return data;
  }
}
