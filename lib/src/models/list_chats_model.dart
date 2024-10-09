class ListChatsModel {
  List<Ticket>? tickets;
  int? count;
  bool? hasMore;

  ListChatsModel({this.tickets, this.count, this.hasMore});

  ListChatsModel.fromJson(Map<String, dynamic> json) {
    if (json['tickets'] != null) {
      tickets = <Ticket>[];
      json['tickets'].forEach((v) {
        tickets!.add(Ticket.fromJson(v));
      });
    }
    count = json['count'];
    hasMore = json['hasMore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tickets != null) {
      data['tickets'] = tickets!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    data['hasMore'] = hasMore;
    return data;
  }
}

class Ticket {
  int? id;
  String? status;
  int? unreadMessages;
  String? lastMessage;
  bool? isGroup;
  bool? greetingSent;
  int? userId;
  int? contactId;
  int? whatsappId;
  int? queueId;
  String? createdAt;
  String? updatedAt;
  Contact? contact;
  User? user;
  Queue? queue;
  Whatsapp? whatsapp;

  Ticket(
      {this.id,
      this.status,
      this.unreadMessages,
      this.lastMessage,
      this.isGroup,
      this.greetingSent,
      this.userId,
      this.contactId,
      this.whatsappId,
      this.queueId,
      this.createdAt,
      this.updatedAt,
      this.contact,
      this.user,
      this.queue,
      this.whatsapp});

  Ticket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    unreadMessages = json['unreadMessages'];
    lastMessage = json['lastMessage'];
    isGroup = json['isGroup'];
    greetingSent = json['greetingSent'];
    userId = json['userId'];
    contactId = json['contactId'];
    whatsappId = json['whatsappId'];
    queueId = json['queueId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    contact =
        json['contact'] != null ? Contact.fromJson(json['contact']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    queue = json['queue'] != null ? Queue.fromJson(json['queue']) : null;
    whatsapp =
        json['whatsapp'] != null ? Whatsapp.fromJson(json['whatsapp']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['unreadMessages'] = unreadMessages;
    data['lastMessage'] = lastMessage;
    data['isGroup'] = isGroup;
    data['greetingSent'] = greetingSent;
    data['userId'] = userId;
    data['contactId'] = contactId;
    data['whatsappId'] = whatsappId;
    data['queueId'] = queueId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (contact != null) {
      data['contact'] = contact!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (queue != null) {
      data['queue'] = queue!.toJson();
    }
    if (whatsapp != null) {
      data['whatsapp'] = whatsapp!.toJson();
    }
    return data;
  }
}

class Contact {
  int? id;
  String? name;
  String? number;
  String? profilePicUrl;

  Contact({this.id, this.name, this.number, this.profilePicUrl});

  Contact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    number = json['number'];
    profilePicUrl = json['profilePicUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['number'] = number;
    data['profilePicUrl'] = profilePicUrl;
    return data;
  }
}

class User {
  int? id;
  String? name;

  User({this.id, this.name});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Queue {
  int? id;
  String? name;
  String? color;

  Queue({this.id, this.name, this.color});

  Queue.fromJson(Map<String, dynamic> json) {
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

class Whatsapp {
  String? name;

  Whatsapp({this.name});

  Whatsapp.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}
