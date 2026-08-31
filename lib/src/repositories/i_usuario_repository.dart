import '../models/usuario.dart';
import '../utils/result.dart';

abstract class IUsuarioRepository {
  Future<Result<Usuario?>> buscarPorUid(String uid);
  Future<Result<Usuario?>> buscarAtual();
  Future<Result<void>> salvar(Usuario usuario);
  Future<Result<void>> atualizarCampos(String uid, Map<String, dynamic> campos);
  Future<Result<void>> atualizarUltimoLogin();
  Stream<Result<List<Usuario>>> streamPorLoja(String lojaId);
  Stream<Result<List<Usuario>>> streamVendedores(String lojaId);
  Future<Result<List<Usuario>>> buscarTodos({String? lojaId});
  Future<Result<String>> uploadAvatar(
      {required String usuarioId, required String filePath});
  Future<Result<void>> deletarImagem(String url);
}
