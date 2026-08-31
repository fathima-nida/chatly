import 'package:messaging_app/core/models/message_models.dart';
import 'package:messaging_app/core/models/user_model.dart';

/// Static sample data so every screen renders realistically without a
/// backend. Replace with Firestore streams later — screens should not
/// need structural changes since the field names mirror what a real
/// Firestore-backed model would expose.
class DummyData {
  DummyData._();

  static final List<UserModel> users = [
    UserModel(
      id: 'u1',
      name: 'Ava Thompson',
      email: 'ava.thompson@mail.com',
      phone: 1234567890,
      avatarUrl: 'https://i.pravatar.cc/150?img=5',
      lastMessage: 'See you tomorrow then!',
      lastMessageTime: DateTime.now().subtract(const Duration(minutes: 4)),
      isOnline: true,
      unreadCount: 2,
    ),
    UserModel(  
      id: 'u2',
      name: 'Liam Carter',
      email: 'liam.carter@mail.com',
      phone: 1030507090,
      avatarUrl: 'https://i.pravatar.cc/150?img=12',
      lastMessage: 'Sent the files, check your inbox.',
      lastMessageTime: DateTime.now().subtract(const Duration(hours: 1)),
      isOnline: false,
      unreadCount: 0,
    ),
    UserModel(
      id: 'u3',
      name: 'Sofia Martinez',
      email: 'sofia.martinez@mail.com',
      phone: 1131517191,
      avatarUrl: 'https://i.pravatar.cc/150?img=32',
      lastMessage: 'Haha that\'s hilarious 😂',
      lastMessageTime: DateTime.now().subtract(const Duration(hours: 3)),
      isOnline: true,
      unreadCount: 5,
    ),
    UserModel(
      id: 'u4',
      name: 'Noah Williams',
      email: 'noah.williams@mail.com',
      phone: 1234560001,
      avatarUrl: 'https://i.pravatar.cc/150?img=15',
      lastMessage: 'Let\'s catch up this weekend',
      lastMessageTime: DateTime.now().subtract(const Duration(days: 1)),
      isOnline: false,
      unreadCount: 0,
    ),
    UserModel(
      id: 'u5',
      name: 'Emma Davis',
      email: 'emma.davis@mail.com',
      phone: 1234560002,
      avatarUrl: 'https://i.pravatar.cc/150?img=25',
      lastMessage: 'Thanks a lot for your help!',
      lastMessageTime: DateTime.now().subtract(const Duration(days: 2)),
      isOnline: false,
      unreadCount: 0,
    ),
    UserModel(
      id: 'u6',
      name: 'Ethan Brown',
      email: 'ethan.brown@mail.com',
      phone: 1234560003,
      avatarUrl: 'https://i.pravatar.cc/150?img=51',
      lastMessage: 'Sounds good, talk soon.',
      lastMessageTime: DateTime.now().subtract(const Duration(days: 4)),
      isOnline: true,
      unreadCount: 1,
    ),
  ];

  /// A sample conversation with the first user, used on the chat screen.
  static List<MessageModel> conversation(String userId) {
    final now = DateTime.now();
    return [
      MessageModel(
        id: 'm1',
        text: 'Hey! How\'s the Flutter project going?',
        time: now.subtract(const Duration(minutes: 40)),
        isSentByMe: false,
      ),
      MessageModel(
        id: 'm2',
        text: 'Pretty good actually, just finishing up the chat UI 🎉',
        time: now.subtract(const Duration(minutes: 38)),
        isSentByMe: true,
        isRead: true,
      ),
      MessageModel(
        id: 'm3',
        text: 'Nice! Are you using Firebase for the backend?',
        time: now.subtract(const Duration(minutes: 35)),
        isSentByMe: false,
      ),
      MessageModel(
        id: 'm4',
        text: 'Yep, Auth + Firestore. Building the UI first though.',
        time: now.subtract(const Duration(minutes: 33)),
        isSentByMe: true,
        isRead: true,
      ),
      MessageModel(
        id: 'm5',
        text: 'Smart approach, keeps things clean and testable.',
        time: now.subtract(const Duration(minutes: 30)),
        isSentByMe: false,
      ),
      MessageModel(
        id: 'm6',
        text: 'Exactly, following a feature-first architecture too.',
        time: now.subtract(const Duration(minutes: 28)),
        isSentByMe: true,
        isRead: true,
      ),
      MessageModel(
        id: 'm7',
        text: 'Send me a screenshot when you get a chance?',
        time: now.subtract(const Duration(minutes: 10)),
        isSentByMe: false,
      ),
      MessageModel(
        id: 'm8',
        text: 'Sure thing, give me a few minutes.',
        time: now.subtract(const Duration(minutes: 6)),
        isSentByMe: true,
        isRead: false,
      ),
      MessageModel(
        id: 'm9',
        text: 'See you tomorrow then!',
        time: now.subtract(const Duration(minutes: 4)),
        isSentByMe: false,
      ),
    ];
  }
}
