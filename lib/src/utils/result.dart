sealed class Result<T> {
  const Result();

  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Failure<T>;

  T? get data => (this is Success<T>) ? (this as Success<T>).data : null;
  Failure<T>? get error => (this is Failure<T>) ? this as Failure<T> : null;
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends Result<T> {
  final String message;
  final int? statusCode;
  final Object? originalError;

  const Failure(this.message, {this.statusCode, this.originalError});
}
