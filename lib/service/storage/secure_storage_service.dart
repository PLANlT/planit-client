import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// SecureStorageService를 싱글톤으로 관리하는 Provider
final Provider<SecureStorageService> secureStorageServiceProvider = Provider(
  (ref) => SecureStorageService(),
);

// SecureStorage 인스턴스를 내부에 두고 이를 제어하는 메서드 정의
// Storage 목적 : JWT 토큰 저장
class SecureStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<String?> getString({
    required String key,
  }) async =>
      _storage.read(key: key);

  Future<void> setString({
    required String key,
    required String value,
  }) async =>
      _storage.write(key: key, value: value);

  Future<void> clear({
    required String key,
  }) async =>
      _storage.delete(key: key);

  Future<void> clearAll() async => _storage.deleteAll();
}
