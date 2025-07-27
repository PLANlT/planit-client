import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/repository/auth/auth_repository.dart';
import 'package:planit/repository/mypage/model/consecutive_days_model.dart';
import 'package:planit/repository/mypage/model/my_info_model.dart';
import 'package:planit/repository/mypage/mypage_repository.dart';
import 'package:planit/service/app/app_service.dart';
import 'package:planit/ui/mypage/mypage_state.dart';

final AutoDisposeStateNotifierProvider<MypageViewModel, MypageState>
    mypageViewModelProvider = StateNotifierProvider.autoDispose(
  (ref) => MypageViewModel(
    mypageRepository: ref.read(mypageRepositoryProvider),
    authRepository: ref.read(authRepositoryProvider),
    appService: ref.read(appServiceProvider.notifier),
  ),
);

class MypageViewModel extends StateNotifier<MypageState> {
  final MypageRepository _mypageRepository;
  final AuthRepository _authRepository;
  final AppService _appService;

  MypageViewModel({
    required MypageRepository mypageRepository,
    required AuthRepository authRepository,
    required AppService appService,
  })  : _mypageRepository = mypageRepository,
        _authRepository = authRepository,
        _appService = appService,
        super(MypageState());

  Future<void> initMypage() async {
    await getMyInfo();
    await getConsecutiveDays();
  }

  Future<void> getMyInfo() async {
    if (mounted) {
      state = state.copyWith(loadingStatus: LoadingStatus.loading);
    }

    final RepositoryResult<MyInfoModel> result =
        await _mypageRepository.getMyInfo();

    switch (result) {
      case SuccessRepositoryResult<MyInfoModel>():
        if (mounted) {
          state = state.copyWith(
            loadingStatus: LoadingStatus.success,
            userEmail: result.data.email,
            userName: result.data.name,
            oAuthType: result.data.signType,
            registrationDate: result.data.createdAt,
          );
        }
      case FailureRepositoryResult<MyInfoModel>():
        if (mounted) {
          state = state.copyWith(
              loadingStatus: LoadingStatus.error,
              errorMessage: '내 정보를 불러오는데 실패했어요.');
        }
    }
  }

  Future<void> getConsecutiveDays() async {
    if (mounted) {
      state = state.copyWith(loadingStatus: LoadingStatus.loading);
    }

    final RepositoryResult<ConsecutiveDaysModel> result =
        await _mypageRepository.getConsecutiveDays();

    switch (result) {
      case SuccessRepositoryResult<ConsecutiveDaysModel>():
        if (mounted) {
          state = state.copyWith(
            loadingStatus: LoadingStatus.success,
            perfectConsecutiveDays: result.data.perfectConsecutiveDays,
            maxConsecutiveDays: result.data.maxConsecutiveDays,
            currentConsecutiveDays: result.data.currentConsecutiveDays,
          );
        }
      case FailureRepositoryResult<ConsecutiveDaysModel>():
        if (mounted) {
          state = state.copyWith(
            loadingStatus: LoadingStatus.error,
            errorMessage: '연속일 정보를 불러오는데 실패했어요.',
          );
        }
    }
  }

  Future<void> signOut() async {
    if (mounted) {
      state = state.copyWith(loadingStatus: LoadingStatus.loading);
    }
    final RepositoryResult<void> result = await _authRepository.signOut();
    switch (result) {
      case SuccessRepositoryResult<void>():
        await _appService.signOut();
        if (mounted) {
          state = state.copyWith(
            loadingStatus: LoadingStatus.success,
          );
        }
      case FailureRepositoryResult<void>():
        if (mounted) {
          state = state.copyWith(
            loadingStatus: LoadingStatus.error,
            errorMessage: '로그아웃에 실패했어요.\n다시 시도해주세요.',
          );
        }
    }
  }

  void toggleTaskAlarm(bool newStatus) {
    if (mounted) {
      state = state.copyWith(isTaskPushAccept: newStatus);
    }
  }

  void toggleGuiltyFreeAlarm(bool newStatus) {
    if (mounted) {
      state = state.copyWith(isGuiltyFreePushAccept: newStatus);
    }
  }

  Future<void> withdraw() async {
    if (mounted) {
      state = state.copyWith(loadingStatus: LoadingStatus.loading);
    }

    final RepositoryResult<void> result = await _mypageRepository.withdraw();
    switch (result) {
      case SuccessRepositoryResult<void>():
        _appService.signOut();
        if (mounted) {
          state = state.copyWith(
            loadingStatus: LoadingStatus.success,
          );
        }
      case FailureRepositoryResult<void>():
        if (mounted) {
          state = state.copyWith(
            loadingStatus: LoadingStatus.error,
            errorMessage: result.messages == null
                ? '회원탈퇴에 실패했어요.\n다시 시도해주세요'
                : result.messages!.first,
          );
        }
    }
  }
}
