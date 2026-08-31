/// Hierarquia de falhas do domínio.
///
/// Usada por todos os repositories e use-cases para propagar erros de forma
/// tipada, sem vazar exceções nuas para a camada de presentation.
abstract class Failure {
  final String message;
  const Failure(this.message);

  @override
  String toString() => '$runtimeType: $message';
}

class FirebaseFailure extends Failure {
  const FirebaseFailure(super.message);
}

class CsvFailure extends Failure {
  const CsvFailure(super.message);
}

class AuthFailure extends Failure {
  const AuthFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure(super.message);
}

class ApiFailure extends Failure {
  const ApiFailure(super.message);
}

// ── Result<T> ─────────────────────────────────────────────────────────────────
// Tipo soma simples para evitar dependência do pacote dartz.

sealed class Result<T> {
  const Result();

  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is FailureResult<T>;

  Failure? get error => switch (this) {
    FailureResult<T> f => f.error,
    _ => null,
  };

  T? get data => null;

  R fold<R>({
    required R Function(T data) onSuccess,
    required R Function(Failure error) onFailure,
  }) {
    return switch (this) {
      Success<T>       s => onSuccess(s.data),
      FailureResult<T> f => onFailure(f.error),
    };
  }
}

final class Success<T> extends Result<T> {
  @override
  final T data;
  const Success(this.data);
}

final class FailureResult<T> extends Result<T> {
  @override
  final Failure error;
  const FailureResult(this.error);
}
