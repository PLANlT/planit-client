class StorageKey {
  static const accessTokenKey = 'accessToken';
  static const refreshTokenKey = 'refreshTokenKey';

  // PlanitStorageService의 key도 이곳에 정의합니다
  // 주의 : bool 타입 저장 시, defaultValue가 false인 것이 자연스러운 네이밍을 사용합니다
  // 예 : isFirstLaunch가 아닌 isNotFirstLaunch가 되어야 초기값이 첫 설치가 됨
  static const isNotFirstLaunch = 'isNotFirstLaunch';

  // 마지막으로 길티프리 모드를 사용한 날짜
  static const lastGuiltyFreeDate = 'lastGuiltyFreeDate';

  // GuiltyFreeStatus 저장
  static const guiltyFreeStatus = 'guiltyFreeStatus';

  // 마지막으로 태스크를 달성한 날짜 (첫 달성 확인 용도)
  static const lastCompleteTaskDate = 'lastCompleteTaskDate';
}
