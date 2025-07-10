import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/repository/auth/auth_repository.dart';
import 'package:planit/ui/login/login_state.dart';

final AutoDisposeStateNotifierProvider<LoginViewModel, LoginState>
    loginViewModelProvider = StateNotifierProvider.autoDispose(
  (ref) => LoginViewModel(
    authRepository: ref.read(authRepositoryProvider),
  ),
);

class LoginViewModel extends StateNotifier<LoginState> {
  final AuthRepository _authRepository;

  LoginViewModel({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(LoginState());

  void googleLogin() {}

  void kakaoLogin() {}

  void naverLogin() {}
}
