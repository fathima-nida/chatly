class AuthModel {
  final String id;
  final String email;
  final String name;
  final int phoneNumber;
  final String photoUrl;

  AuthModel({
    required this.id,
    required this.email,
    required this.phoneNumber,
    required this.name,
    required this.photoUrl,
  });

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      id: map['id'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      name: map['name'],
      photoUrl: map['photoUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'phoneNumber': phoneNumber,
      'name': name,
      'photoUrl': photoUrl,
    };
  }
}