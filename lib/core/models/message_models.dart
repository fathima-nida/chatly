class MessageModel {
  final String id;
  final String text;
  final DateTime time;
  final bool isSentByMe;
  final bool isRead;

  const MessageModel({
    required this.id,
    required this.text,
    required this.time,
    required this.isSentByMe,
    this.isRead = false,
  });
}
