// core/error/failures.dart

// 1. The Base Class
// All specific errors will extend this. 
// It forces every error to have a message.
abstract class Failure {
  final String message;
  const Failure(this.message);
}

// 2. Server Failure
// Used when the API returns 500, 404, or the internet is down.
class ServerFailure extends Failure {
  const ServerFailure([super.message = 'An unexpected server error occurred.']);
}

// 3. Connection Failure
// Used specifically for "No Internet" states.
class ConnectionFailure extends Failure {
  const ConnectionFailure([super.message = 'No internet connection.']);
}

// 4. Database Failure
// Used when local storage (Isar/Hive) fails.
class DatabaseFailure extends Failure {
  const DatabaseFailure([super.message = 'Failed to access local database.']);
}