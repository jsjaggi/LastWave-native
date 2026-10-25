import 'dart:async';

abstract class CacheService {
  Future<T?> get<T>(String key);
  Future<void> set<T>(String key, T value);
  Future<void> remove(String key);
  Future<void> clear();
}

class CacheServiceImpl implements CacheService {
  final Map<String, _CacheEntry> _cache = {};

  @override
  Future<T?> get<T>(String key) async {
    if (!_cache.containsKey(key)) return null;

    final entry = _cache[key]!;
    if (entry.expiry.isBefore(DateTime.now())) {
      _cache.remove(key);
      return null;
    }

    return entry.value as T;
  }

  @override
  Future<void> set<T>(String key, T value) async {
    _cache[key] = _CacheEntry(
      value: value,
      expiry: DateTime.now().add(const Duration(hours: 24)),
    );
  }

  @override
  Future<void> remove(String key) async {
    _cache.remove(key);
  }

  @override
  Future<void> clear() async {
    _cache.clear();
  }
}

class _CacheEntry {
  final dynamic value;
  final DateTime expiry;

  _CacheEntry({required this.value, required this.expiry});
}