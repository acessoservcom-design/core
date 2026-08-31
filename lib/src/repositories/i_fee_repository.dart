import '../models/fee_config.dart';
import '../utils/result.dart';

abstract class IFeeRepository {
  Stream<Result<FeeConfig>> stream();
  Stream<FeeConfig> streamConfig();
  Future<Result<FeeConfig>> fetch();
  Future<FeeConfig> fetchConfig();
  Future<Result<void>> save(FeeConfig config);
  Future<Result<void>> saveForOperator(String operadora, FeeConfig config);
  Future<Result<FeeConfig>> fetchForOperator(String operadora);
  Future<Result<void>> saveDefaultInfinityTaxas();
}
