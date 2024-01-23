class GetNews {
  String? title;
  String? description;
  bool? isDeleted;
  Null? deleterId;
  Null? deletionTime;
  Null? lastModificationTime;
  Null? lastModifierId;
  String? creationTime;
  Null? creatorId;
  String? id;

  GetNews(
      {this.title,
      this.description,
      this.isDeleted,
      this.deleterId,
      this.deletionTime,
      this.lastModificationTime,
      this.lastModifierId,
      this.creationTime,
      this.creatorId,
      this.id});

  GetNews.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    isDeleted = json['isDeleted'];
    deleterId = json['deleterId'];
    deletionTime = json['deletionTime'];
    lastModificationTime = json['lastModificationTime'];
    lastModifierId = json['lastModifierId'];
    creationTime = json['creationTime'];
    creatorId = json['creatorId'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = title;
    data['description'] = description;
    data['isDeleted'] = isDeleted;
    data['deleterId'] = deleterId;
    data['deletionTime'] = deletionTime;
    data['lastModificationTime'] = lastModificationTime;
    data['lastModifierId'] = lastModifierId;
    data['creationTime'] = creationTime;
    data['creatorId'] = creatorId;
    data['id'] = id;
    return data;
  }
}
