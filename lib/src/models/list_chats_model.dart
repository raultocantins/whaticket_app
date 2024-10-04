class ListChatsModel {
  List<Tickets>? tickets;
  int? count;
  bool? hasMore;

  ListChatsModel({this.tickets, this.count, this.hasMore});

  ListChatsModel.fromJson(Map<String, dynamic> json) {
    if (json['tickets'] != null) {
      tickets = <Tickets>[];
      json['tickets'].forEach((v) {
        tickets!.add(Tickets.fromJson(v));
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

class Tickets {
  int? id;
  Contact? contact;

  Tickets({this.id, this.contact});

  Tickets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contact =
        json['contact'] != null ? Contact.fromJson(json['contact']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (contact != null) {
      data['contact'] = contact!.toJson();
    }
    return data;
  }
}

class Contact {
  int? id;
  String? name;

  Contact({this.id, this.name});

  Contact.fromJson(Map<String, dynamic> json) {
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
