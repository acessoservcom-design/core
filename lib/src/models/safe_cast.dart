/// Helper functions for safe type casting from MySQL/JSON data.
/// MySQL returns int (0/1) for booleans and strings for decimals.
bool safeBool(dynamic v, [bool def = true]) {
  if (v == null) return def;
  if (v is bool) return v;
  if (v is num) return v != 0;
  if (v is String) return v == '1' || v.toLowerCase() == 'true';
  return def;
}

String safeStr(dynamic v, [String def = '']) {
  if (v == null) return def;
  return v.toString();
}

String? safeStrNull(dynamic v) {
  if (v == null) return null;
  return v.toString();
}

num? safeNum(dynamic v) {
  if (v == null) return null;
  if (v is num) return v;
  if (v is String) return num.tryParse(v);
  return null;
}

DateTime? safeDate(dynamic v) {
  if (v == null) return null;
  if (v is DateTime) return v;
  return DateTime.tryParse(v.toString())?.toUtc();
}

DateTime safeDateUtc(dynamic v, [DateTime? def]) {
  return safeDate(v) ?? def ?? DateTime.now().toUtc();
}

double safeDouble(dynamic v, [double def = 0.0]) {
  if (v == null) return def;
  if (v is num) return v.toDouble();
  if (v is String) return double.tryParse(v) ?? def;
  return def;
}

int safeInt(dynamic v, [int def = 0]) {
  if (v == null) return def;
  if (v is int) return v;
  if (v is num) return v.toInt();
  if (v is String) return int.tryParse(v) ?? def;
  return def;
}
