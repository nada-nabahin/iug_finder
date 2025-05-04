import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iug_finder/core/helpers/constants.dart';
import 'package:iug_finder/core/helpers/shared_pref_helper.dart';
import 'package:iug_finder/features/login/logic/cubit/login_state.dart';
import 'package:iug_finder/features/login/data/models/login_req_body.dart';
import 'package:iug_finder/features/login/data/repos/login_repos.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginReqBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(success: (loginResponse) async {
      await saveUserToken(loginResponse.userData?.token ?? "");
      await saveUserName(loginResponse.userData?.userName ?? "");
      emit(LoginState.success(loginResponse));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
    });
  }

  saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
  }

  saveUserName(String username) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userName, username);
  }
}
