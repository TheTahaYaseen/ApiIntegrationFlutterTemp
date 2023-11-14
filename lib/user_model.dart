class UserModel {
  String? createdAt;
  String? email;
  int? id;
  String? name;

  UserModel({this.createdAt, this.email, this.id, this.name});

  UserModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    email = json['email'];
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['created_at'] = createdAt;
    data['email'] = email;
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

