// features/auth/domain/entities/user_entity.dart
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  // The core Fields
  final String id;
  final String email;
  final String username;
  final String? profilePicUrl; // Nullable: They might not have one yet.
  final String? bio;

  // The Constructor
  const UserEntity({
    required this.id,
    required this.email,
    required this.username,
    this.profilePicUrl,
    this.bio,
  });

  // The Empty user (Null Object Pattern)
  static const empty = UserEntity(
    id: '',
    email: '',
    username: '',
    profilePicUrl: null,
    bio: null,
  );
  // Convinience Getters
  bool get isEmpty =>this== UserEntity.empty;
  bool get isNotEmpty=>this !=UserEntity.empty;

  // Equatable propd
  @override
List<Object?> get props => [id, email, username, profilePicUrl, bio];
}
