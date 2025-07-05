enum GuiltyFreeStatus {
  // 길티프리 모드가 아님
  none,
  // 길티프리 진행 중
  ing,
  // 길티프리가 종료된 후, 앱을 처음 켰을 때>종료 화면 노출 필요
  end,
}