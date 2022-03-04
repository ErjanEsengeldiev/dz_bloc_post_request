class User {
  String? name;
  String? job;
  String? id;
  String? createdAt;

  User({this.name, this.job, this.id, this.createdAt});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    job = json['job'];
    id = json['id'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['job'] = job;
    data['id'] = id;
    data['createdAt'] = createdAt;
    return data;
  }
}

class UserEdit {
  String? name;
  String? job;

  String? createdAt;

  UserEdit({this.name, this.job, this.createdAt});

  UserEdit.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    job = json['job'];
    createdAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['job'] = job;
    data['updatedAt'] = createdAt;
    return data;
  }
}
