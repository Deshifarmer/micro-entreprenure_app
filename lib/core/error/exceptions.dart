/// {@template result}
sealed class Result<S, E extends Exception> {
  Result();
}

/// success
class Success<S, E extends Exception> extends Result<S, E> {
  Success(this.data);
  final S data;
}

/// {@template failure}
class ServerFailor<S, E extends Exception> extends Result<S, E> {
  ServerFailor(this.error);
  final E error;
}

/// rate limit
// class RateLimitFailor<S, E extends Exception> extends Result<S, E> {
//   RateLimitFailor(this.error);
//   final E error;
// }

/// ip block
// class IpBlockFailor<S, E extends Exception> extends Result<S, E> {
//   IpBlockFailor(this.error);
//   final E error;
// }
