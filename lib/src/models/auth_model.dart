class AuthModel {
  String? token;
  User? user;

  AuthModel({this.token, this.user});

  AuthModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class QueueModel {
  int? id;
  String? name;
  String? color;

  QueueModel({this.id, this.name, this.color});

  QueueModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['color'] = color;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? profile;
  List<QueueModel>? queues;
  String? startWork;
  String? endWork;
  String? isTricked;
  String? status;

  User(
      {this.id,
      this.name,
      this.email,
      this.profile,
      this.queues,
      this.startWork,
      this.endWork,
      this.isTricked,
      this.status});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    profile = json['profile'];
    if (json['queues'] != null) {
      queues = <QueueModel>[];
      json['queues'].forEach((v) {
        queues!.add(QueueModel.fromJson(v));
      });
    }
    startWork = json['startWork'];
    endWork = json['endWork'];
    isTricked = json['isTricked'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['profile'] = profile;
    if (queues != null) {
      data['queues'] = queues!.map((v) => v.toJson()).toList();
    }
    data['startWork'] = startWork;
    data['endWork'] = endWork;
    data['isTricked'] = isTricked;
    data['status'] = status;
    return data;
  }
}
