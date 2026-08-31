import '../models/nfe.dart';

abstract class INFeRepository {
  Future<NFe> enviarNFe(NFe nfe);
  Future<NFe> cancelarNFe({required NFe nfe, required String justificativa});
  Future<NFe> consultarSituacao({required NFe nfe});
  Future<NFe> cceNFe({required NFe nfe, required String correcao});
  Future<bool> inutilizarNumeracao({
    required String empresaId,
    required String lojaId,
    required int cUF,
    required int ano,
    required String cnpj,
    required int serie,
    required int nNFIni,
    required int nNFFim,
    required String justificativa,
  });
  Future<String> gerarDanfe({required String chave});
  Future<NFe> verificarProcessamento({required NFe nfe});
}
