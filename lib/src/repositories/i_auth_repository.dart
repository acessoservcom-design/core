import '../models/funcionario.dart';
import '../utils/result.dart';

abstract class IAuthRepository {
  Future<Result<Funcionario>> loginPin(String lojaId, String pin);
  Future<Result<String>> loginEmail(
      String empresaId, String email, String senha);
  Future<Result<String>> refreshToken(String refreshToken);
  Future<Result<void>> logout();
}
