class UserModel {
  final String id;
  final String name;
  final int phone;
  final String email;
  final String avatarUrl;
  final String lastMessage;
  final DateTime lastMessageTime;
  final bool isOnline;
  final int unreadCount;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.avatarUrl,
    required this.lastMessage,
    required this.lastMessageTime,
    this.isOnline = false,
    this.unreadCount = 0,
  });
}
