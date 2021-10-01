class Message {
  final String body;
  final String sender;

  Message({required this.body, required this.sender});

  Message.fromJson(Map<String, Object?> json)
      : this(
          body: json['body']! as String,
          sender: json['sender']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'body': body,
      'sender': sender,
    };
  }
}
