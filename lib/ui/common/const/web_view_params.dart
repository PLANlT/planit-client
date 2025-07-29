// Go-router로 여러 개의 파라미터 전달 시 Map 형태로 묶어야 하여, 클래스 하나로 정의
class WebViewParams {
  final String title;
  final String url;

  WebViewParams({
    required this.title,
    required this.url,
  });
}
