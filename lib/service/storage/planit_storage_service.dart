import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// PlanitStorageService를 싱글톤으로 관리하는 Provider
final Provider<PlanitStorageService> planitStorageServiceProvider =
    Provider<PlanitStorageService>(
  (ref) => PlanitStorageService(),
);

// SharedPreferences 인스턴스를 내부에 두고 이를 제어하는 메서드 정의
// prefs는 자체적으로 싱글톤이나, 매번 인스턴스화를 불러오는 로직 작성이 필요해 Service로 간소화
// Storage 목적 : 앱을 켰다 켜도 유지되어야 하거나 로컬에서 빠르게 불러와야 하는 데이터 저장
// defaultValue의 역할 : KEY로 불러올(저장된) 데이터가 없는 경우, 초기값 불러올 수 있도록 함
class PlanitStorageService {
  SharedPreferences? _prefs;

  // 멤버 함수 내부에서 호출합니다
  Future<void> _init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<bool> getBool({
    required String key,
    bool defaultValue = false,
  }) async {
    await _init();
    return _prefs!.getBool(key) ?? defaultValue;
  }

  Future<void> setBool({
    required String key,
    required bool value,
  }) async {
    await _init();
    await _prefs!.setBool(key, value);
  }

  Future<int> getInt({
    required String key,
    int defaultValue = 0,
  }) async {
    await _init();
    return _prefs!.getInt(key) ?? defaultValue;
  }

  Future<void> setInt({
    required String key,
    required int value,
  }) async {
    await _init();
    await _prefs!.setInt(key, value);
  }

  Future<double> getDouble({
    required String key,
    double defaultValue = 0,
  }) async {
    await _init();
    return _prefs!.getDouble(key) ?? defaultValue;
  }

  Future<void> setDouble({
    required String key,
    required double value,
  }) async {
    await _init();
    await _prefs!.setDouble(key, value);
  }

  Future<String> getString({
    required String key,
    String defaultValue = '',
  }) async {
    await _init();
    return _prefs!.getString(key) ?? defaultValue;
  }

  Future<void> setString({
    required String key,
    required String value,
  }) async {
    await _init();
    await _prefs!.setString(key, value);
  }

  Future<List<String>> getStringList({
    required String key,
    List<String>? defaultValue,
  }) async {
    await _init();
    return _prefs!.getStringList(key) ?? defaultValue ?? [];
  }

  Future<void> setStringList({
    required String key,
    required List<String> value,
  }) async {
    await _init();
    await _prefs!.setStringList(key, value);
  }
}
