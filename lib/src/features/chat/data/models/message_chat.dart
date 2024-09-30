class MessageChat {
  final String id;
  int ack;
  bool read;
  bool isEdited;
  bool fromMe;
  String body;
  String mediaUrl;
  String mediaType;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  String quotedMsgId;
  MessageChat quotedMsg;
  int ticketId;
  int contactId;
  MessageChat({
    required this.id,
    required this.ack,
    required this.body,
    required this.contactId,
    required this.createdAt,
    required this.updatedAt,
    required this.fromMe,
    required this.isDeleted,
    required this.isEdited,
    required this.mediaType,
    required this.mediaUrl,
    required this.quotedMsg,
    required this.quotedMsgId,
    required this.read,
    required this.ticketId,
  });
}
