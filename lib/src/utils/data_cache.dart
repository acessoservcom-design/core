class DataCache {
  static final DataCache _instance = DataCache._();
  static DataCache get instance => _instance;
  DataCache._() : defaultTtl = const Duration(minutes: 5);

  final _store = <String, _CacheEntry>{};
  final Duration defaultTtl;

  DataCache.withTtl({this.defaultTtl = const Duration(minutes: 5)});

  T? get<T>(String key) {
    final entry = _store[key];
    if (entry == null) return null;
    if (entry.isExpired) {
      _store.remove(key);
      return null;
    }
    return entry.value as T;
  }

  void set<T>(String key, T value, {Duration? ttl}) {
    _store[key] = _CacheEntry(value, DateTime.now().add(ttl ?? defaultTtl));
  }

  void remove(String key) => _store.remove(key);
  void clear() => _store.clear();
}

class _CacheEntry {
  final dynamic value;
  final DateTime expiresAt;
  const _CacheEntry(this.value, this.expiresAt);
  bool get isExpired => DateTime.now().isAfter(expiresAt);
}
