import '../utils/result.dart';

class SyncPayload {
  final String terminalId;
  final String lojaId;
  final String empresaId;
  final List<Map<String, dynamic>> creates;
  final List<Map<String, dynamic>> updates;
  final List<Map<String, String>> deletes;
  final int? ultimoCodigoNfce;
  final DateTime? ultimoSyncAt;

  const SyncPayload({
    required this.terminalId,
    required this.lojaId,
    required this.empresaId,
    this.creates = const [],
    this.updates = const [],
    this.deletes = const [],
    this.ultimoCodigoNfce,
    this.ultimoSyncAt,
  });
}

class SyncResult {
  final List<Map<String, dynamic>> entities;
  final DateTime syncAt;
  final int? contadorNfceAtualizado;

  const SyncResult({
    required this.entities,
    required this.syncAt,
    this.contadorNfceAtualizado,
  });
}

abstract class ISyncRepository {
  Future<Result<SyncResult>> push(SyncPayload payload);
  Future<Result<SyncResult>> pull(String lojaId, String terminalId,
      DateTime? ultimoSync);
}
