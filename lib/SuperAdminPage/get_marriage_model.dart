class GetMarriage {
  String? id;
  String? husbandFullName;
  String? wifeFullName;
  String? husbandBirthDate;
  String? wifeBirthDate;
  String? marriageType;
  String? placeOfMarriage;
  String? dateOfMarriage;
  String? marriageRegistrar;

  GetMarriage(
      {this.id,
      this.husbandFullName,
      this.wifeFullName,
      this.husbandBirthDate,
      this.wifeBirthDate,
      this.marriageType,
      this.placeOfMarriage,
      this.dateOfMarriage,
      this.marriageRegistrar});

  GetMarriage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    husbandFullName = json['husbandFullName'];
    wifeFullName = json['wifeFullName'];
    husbandBirthDate = json['husbandBirthDate'];
    wifeBirthDate = json['wifeBirthDate'];
    marriageType = json['marriageType'];
    placeOfMarriage = json['placeOfMarriage'];
    dateOfMarriage = json['dateOfMarriage'];
    marriageRegistrar = json['marriageRegistrar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['husbandFullName'] = this.husbandFullName;
    data['wifeFullName'] = this.wifeFullName;
    data['husbandBirthDate'] = this.husbandBirthDate;
    data['wifeBirthDate'] = this.wifeBirthDate;
    data['marriageType'] = this.marriageType;
    data['placeOfMarriage'] = this.placeOfMarriage;
    data['dateOfMarriage'] = this.dateOfMarriage;
    data['marriageRegistrar'] = this.marriageRegistrar;
    return data;
  }
}
