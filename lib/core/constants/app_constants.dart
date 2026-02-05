// core/constants/app_constants.dart
class AppConstants {
  // 1. The Guard Rail (Private Constructor)
  const AppConstants._();
  // 2. Network Configuration
  static const String apiBaseUrl = 'https://api.nexus-social.com/v1';

  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;

  // 3. Local Storage Keys
  static const String tokenKey = 'auth_token';
  static const String themeKey = 'is_dark_mode';
  static const String firstTimeUserKey = 'is_first_time';

  // 4. Instagram/Nexus Business Logic Limits
  static const int maxCaptionLength = 2200;   // Max characters for a caption (Instagram is 2200).
  static const int defaultPageSize = 10;  // How many posts to fetch at a time (Pagination).
  static const int maxFileSize = 10 * 1024 * 1024;  // Max file size for uploads in Bytes (e.g., 10MB = 10 * 1024 * 1024).



  // 5. UI Design Tokens
  static const double defaultPadding = 16.0;
  static const double borderRadius = 12.0;
  static const double avatarSize = 40.0;
}
