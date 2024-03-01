/// Represents a failure in the application.
abstract class Failure {}

/// Represents a failure related to server communication.
class ServerFailure extends Failure {}

/// Represents a failure related to caching data.
class CacheFailure extends Failure {}

/// Represents a failure related to network connectivity.
class NetworkFailure extends Failure {}
