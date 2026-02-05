// core/network/api_endpoints.dart
class ApiEndpoints {
  // Private constructor to prevent instantiation
  const ApiEndpoints._();
  // 1. Auth Routes
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String refreshToken = '/auth/refresh';
  static const String logout = '/auth/logout';

  // 2.User Routes
  static const String currentUser = '/users/me';
  static const String updateProfile = '/users/update';

  // 3. Feed Routes
  static const String getFeed = '/feed/timeline';
  static const String createPost = '/posts/create';

  // Dynamic Routes (Functions)
  static String likePost(String postId) => '/posts/$postId/like';
  static String deletePost(String postId) => '/posts/$postId';
  static String getComments(String postId) => '/posts/$postId/comments';
}
