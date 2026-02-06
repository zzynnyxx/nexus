// features/auth/data/models/user_model.dart
// 1 IMPORT THE ENTITY
// We need to know whaat we are translatE INTO
import 'package:nexus_social/features/auth/auth.dart';

// DEFINE THE CLASS

class UserModel extends UserEntity {
  // 3.The constructors
  // we just pass data up to the parent (UserEntity)using "super"
  const UserModel({
    required super.id,
    required super.email,
    required super.username,
    required super.profilePicUrl,
    required super.bio,
  });

  // POWER 1: FROM JSON
  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      username: map['username'] ?? '',
      //  these can be null so need for ??
      profilePicUrl: map['profilePicUrl'],
      bio: map['bio'],
    );
  }
// POWER 2 :To Json()
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'profile_pic_url': profilePicUrl,
      'bio': bio,
    };
  }
}
