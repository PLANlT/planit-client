// 모든 Repository 메서드는 RepositoryResult를 반환합니다
sealed class RepositoryResult<T> {
  const RepositoryResult();
}

// API 응답이 성공적일 때 반환합니다
class SuccessRepositoryResult<T> extends RepositoryResult<T> {
  const SuccessRepositoryResult({required this.data});

  final T data;
}

// API 응답에 오류가 있을 때 반환합니다
class FailureRepositoryResult<T> extends RepositoryResult<T> {
  const FailureRepositoryResult({
    this.error,
    this.messages,
  });

  final Object? error;
  final List<String>? messages;
}