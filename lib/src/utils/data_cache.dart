class DataCache {
  DataCache._();
  static final DataCache instance = DataCache._();

  final _store = <String, _CacheEntry>{};

  T? get<T>(String key) {
    final entry = _store[key];
    if (entry == null) return null;
    if (DateTime.now().isAfter(entry.expiresAt)) {
      _store.remove(key);
      return null;
    }
    return entry.value as T?;
  }

  void set<T>(String key, T value, {Duration ttl = const Duration(minutes: 5)}) {
    _store[key] = _CacheEntry(value: value, expiresAt: DateTime.now().add(ttl));
  }

  void remove(String key) => _store.remove(key);

  void clear() => _store.clear();
}

class _CacheEntry {
  final dynamic value;
  final DateTime expiresAt;
  _CacheEntry({required this.value, required this.expiresAt});
}
