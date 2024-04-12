class GetUserDetails {
  String? memberName;
  String? role;
  String? memberEmail;
  String? userName;
  String? phoneNumber;
  Null? lastModificationTime;
  Null? lastModifierId;
  String? creationTime;
  Null? creatorId;
  String? id;
  String? bloodGroup;

  GetUserDetails(
      {this.memberName,
      this.role,
      this.memberEmail,
      this.userName,
      this.phoneNumber,
      this.lastModificationTime,
      this.lastModifierId,
      this.creationTime,
      this.creatorId,
      this.id,
      this.bloodGroup});

  GetUserDetails.fromJson(Map<String, dynamic> json) {
    memberName = json['memberName'];
    role = json['role'];
    memberEmail = json['memberEmail'];
    userName = json['userName'];
    phoneNumber = json['phoneNumber'];
    lastModificationTime = json['lastModificationTime'];
    lastModifierId = json['lastModifierId'];
    creationTime = json['creationTime'];
    creatorId = json['creatorId'];
    id = json['id'];
    bloodGroup = json['bloodGroup'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['memberName'] = this.memberName;
    data['role'] = this.role;
    data['memberEmail'] = this.memberEmail;
    data['userName'] = this.userName;
    data['phoneNumber'] = this.phoneNumber;
    data['lastModificationTime'] = this.lastModificationTime;
    data['lastModifierId'] = this.lastModifierId;
    data['creationTime'] = this.creationTime;
    data['creatorId'] = this.creatorId;
    data['id'] = this.id;
    data['bloodGroup'] = this.bloodGroup;
    return data;
  }
}

class GetUserDetailss {
  String? memberName;
  String? role;
  String? memberEmail;
  String? userName;
  String? phoneNumber;
  Null? lastModificationTime;
  Null? lastModifierId;
  String? creationTime;
  Null? creatorId;
  String? id;

  GetUserDetailss({
    this.memberName,
    this.role,
    this.memberEmail,
    this.userName,
    this.phoneNumber,
    this.lastModificationTime,
    this.lastModifierId,
    this.creationTime,
    this.creatorId,
    this.id,
  });

  GetUserDetailss.fromJson(Map<String, dynamic> json) {
    memberName = json['memberName'];
    role = json['role'];
    memberEmail = json['memberEmail'];
    userName = json['userName'];
    phoneNumber = json['phoneNumber'];
    lastModificationTime = json['lastModificationTime'];
    lastModifierId = json['lastModifierId'];
    creationTime = json['creationTime'];
    creatorId = json['creatorId'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['memberName'] = this.memberName;
    data['role'] = this.role;
    data['memberEmail'] = this.memberEmail;
    data['userName'] = this.userName;
    data['phoneNumber'] = this.phoneNumber;
    data['lastModificationTime'] = this.lastModificationTime;
    data['lastModifierId'] = this.lastModifierId;
    data['creationTime'] = this.creationTime;
    data['creatorId'] = this.creatorId;
    data['id'] = this.id;

    return data;
  }
}
