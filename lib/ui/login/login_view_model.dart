import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/repository/auth/auth_repository.dart';
import 'package:planit/repository/auth/model/sign_in_model.dart';
import 'package:planit/ui/login/login_state.dart';

import '../../service/app/app_service.dart';

final AutoDisposeStateNotifierProvider<LoginViewModel, LoginState>
    loginViewModelProvider = StateNotifierProvider.autoDispose(
  (ref) => LoginViewModel(
    authRepository: ref.read(authRepositoryProvider),
    appService: ref.read(appServiceProvider.notifier),
  ),
);

class LoginViewModel extends StateNotifier<LoginState> {
  final AuthRepository _authRepository;
  final AppService _appService;

  LoginViewModel({
    required AuthRepository authRepository,
    required AppService appService,
  })  : _authRepository = authRepository,
        _appService = appService,
        super(LoginState());

  // 구글 로그인
  Future<void> googleLogin() async {
    if (mounted) {
      state = state.copyWith(loadingStatus: LoadingStatus.loading);
    }
    final RepositoryResult<SignInModel> result =
        await _authRepository.googleLogin();
    switch (result) {
      case SuccessRepositoryResult<SignInModel>():
        // 기존 회원>로그인
        if (result.data.signUpCompleted) {
          appSignIn(
            accessToken: result.data.accessToken,
            refreshToken: result.data.refreshToken!,
          );
        } else {
          // 신규 회원>회원가입
          goTosToAppSignUp(
            tempAccessToken: result.data.accessToken,
            type: 'GOOGLE',
            oAuthToken: result.data.oAuthToken,
          );
        }
      case FailureRepositoryResult<SignInModel>():
        if (mounted) {
          state = state.copyWith(
            loadingStatus: LoadingStatus.error,
            errorMessage: result.messages!.first,
          );
        }
    }
  }

  Future<void> kakaoLogin() async {
    if (mounted) {
      state = state.copyWith(loadingStatus: LoadingStatus.loading);
    }
    final RepositoryResult<SignInModel> result =
        await _authRepository.kakaoLogin();
    switch (result) {
      case SuccessRepositoryResult<SignInModel>():
        // 기존 회원>로그인
        if (result.data.signUpCompleted) {
          appSignIn(
            accessToken: result.data.accessToken,
            refreshToken: result.data.refreshToken!,
          );
        } else {
          // 신규 회원>회원가입
          goTosToAppSignUp(
            tempAccessToken: result.data.accessToken,
            type: 'KAKAO',
            oAuthToken: result.data.oAuthToken,
          );
        }
      case FailureRepositoryResult<SignInModel>():
        if (mounted) {
          state = state.copyWith(
            loadingStatus: LoadingStatus.error,
            errorMessage: result.messages!.first,
          );
        }
    }
  }

  Future<void> naverLogin() async {
    if (mounted) {
      state = state.copyWith(loadingStatus: LoadingStatus.loading);
    }
    final RepositoryResult<SignInModel> result =
        await _authRepository.naverLogin();
    switch (result) {
      case SuccessRepositoryResult<SignInModel>():
        // 기존 회원>로그인
        if (result.data.signUpCompleted) {
          appSignIn(
            accessToken: result.data.accessToken,
            refreshToken: result.data.refreshToken!,
          );
        } else {
          // 신규 회원>회원가입
          goTosToAppSignUp(
            tempAccessToken: result.data.accessToken,
            type: 'NAVER',
            oAuthToken: result.data.oAuthToken,
          );
        }
      case FailureRepositoryResult<SignInModel>():
        if (mounted) {
          state = state.copyWith(
            loadingStatus: LoadingStatus.error,
            errorMessage: result.messages!.first,
          );
        }
    }
  }

  void agreeTermOfInfo() {
    if (mounted) {
      state = state.copyWith(isTermOfInfoAgreed: true);
    }
  }

  void agreeTermOfUse() {
    if (mounted) {
      state = state.copyWith(isTermOfUseAgreed: true);
    }
  }

  void agreeTermOfPrivacy() {
    if (mounted) {
      state = state.copyWith(isTermOfPrivacyAgreed: true);
    }
  }

  void agreeThirdPartyAdConsent() {
    if (mounted) {
      state = state.copyWith(isThirdPartyAdConsent: true);
    }
  }

  void agreeAgeRestriction() {
    if (mounted) {
      state = state.copyWith(isAgeRestrictionAgreed: true);
    }
  }

  Future<void> appSignIn({
    required String accessToken,
    required String refreshToken,
  }) async {
    // AppService 로그인 처리
    await _appService.signIn(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
    if (mounted) {
      state = state.copyWith(
        loadingStatus: LoadingStatus.success,
        isLoginCompleted: true,
      );
    }
    debugPrint('[로그인 완료]');
  }

  // 회원가입을 위해 약관동의 라우팅 처리+임시 토큰 저장
  // 추후 동일 데이터로 로그인 시도하기 위해 로그인 타입+토큰 저장
  void goTosToAppSignUp({
    required String tempAccessToken,
    required String type,
    required String oAuthToken,
  }) {
    if (mounted) {
      state = state.copyWith(
        loadingStatus: LoadingStatus.success,
        isLoginCompleted: false,
        tempAccessToken: tempAccessToken,
        signUpType: type,
        oAuthToken: oAuthToken,
      );
    }
    debugPrint('[회원가입 준비 완료]');
  }

  // 약관동의 완료 후 저장된 정보로 로그인
  Future<void> appSignUp() async {
    try {
      // 약관 동의
      final RepositoryResult<void> result = await _authRepository.agreeTerms(
        tempAccessToken: 'Bearer ${state.tempAccessToken}',
      );
      // 동의 성공 시 저장된 정보로 로그인 재시도
      switch (result) {
        case SuccessRepositoryResult<void>():
          final RepositoryResult<SignInModel> loginResult =
              await _authRepository.signUp(
            type: state.signUpType,
            oAuthToken: state.oAuthToken,
          );
          switch (loginResult) {
            case SuccessRepositoryResult<SignInModel>():
              await appSignIn(
                accessToken: loginResult.data.accessToken,
                refreshToken: loginResult.data.refreshToken!,
              );
            case FailureRepositoryResult<SignInModel>():
              if (mounted) {
                state = state.copyWith(
                  errorMessage: '회원가입에 실패했어요. 다시 시도해주세요',
                );
              }
          }
        case FailureRepositoryResult<void>():
          if (mounted) {
            state = state.copyWith(
              errorMessage: '회원가입에 실패했어요. 다시 시도해주세요',
            );
          }
      }
    } catch (e) {
      if (mounted) {
        state = state.copyWith(
          errorMessage: '회원가입에 실패했어요. 다시 시도해주세요',
        );
      }
    }
  }

  // 로그인 중도 취소 시 라우팅 올바르게 될 수 있도록 초기화
  void routingRefresh() {
    if (mounted) {
      state = state.copyWith(isLoginCompleted: null);
    }
  }
}
