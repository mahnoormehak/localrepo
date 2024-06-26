class Message {
  int? id;
  String toId;
  String fromId;
  String msg;
  String sent;
  String read;
  String type;

  Message({
    required this.id,
    required this.toId,
    required this.fromId,
    required this.msg,
    required this.sent,
    required this.read,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'toId': toId,
      'fromId': fromId,
      'msg': msg,
      'sent': sent,
      'read': read,
      'type': type,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'],
      toId: map['toId'],
      fromId: map['fromId'],
      msg: map['msg'],
      sent: map['sent'],
      read: map['read'],
      type: map['type'],
    );
  }
}

class ChatUser {
  String id;
  String name;
  String image;
  String lastActive;
  bool isOnline;

  ChatUser({
    required this.id,
    required this.name,
    required this.image,
    required this.lastActive,
    required this.isOnline,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'lastActive': lastActive,
      'isOnline': isOnline,
    };
  }

  factory ChatUser.fromMap(Map<String, dynamic> map) {
    return ChatUser(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      lastActive: map['lastActive'],
      isOnline: map['isOnline'],
    );
  }
}
