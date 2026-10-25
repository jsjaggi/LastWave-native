abstract class RateLimiter {
  Future<T> execute<T>(Future<T> Function() operation);
}

class RateLimiterImpl implements RateLimiter {
  final Map<String, DateTime> _lastRequests = {};
  final Duration _minInterval = const Duration(milliseconds: 100);

  @override
  Future<T> execute<T>(Future<T> Function() operation) async {
    final key = operation.toString();
    final last = _lastRequests[key];

    if (last != null) {
      final elapsed = DateTime.now().difference(last);
      if (elapsed < _minInterval) {
        await Future.delayed(_minInterval - elapsed);
      }
    }

    final result = await operation();
    _lastRequests[key] = DateTime.now();
    return result;
  }
}