import 'package:drb_shipment_user/core/enums/state_status.dart';
import 'package:drb_shipment_user/core/utils/navigator_helper.dart';
import 'package:drb_shipment_user/features/main_view/presentation/screens/main_view_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants.dart';
import '../../../data/models/login_params.dart';
import '../../../domain/use_cases/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());

  static LoginCubit get(context) => BlocProvider.of(context);

  final _loginUsecase = sl<LoginUsecase>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(state.copyWith(status: StateStatus.loading));
    final result = await _loginUsecase.call(
      params: LoginParams(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: StateStatus.error,
            errorMessage: failure.message,
          ),
        );
      },
      (user) {
        emit(state.copyWith(status: StateStatus.success));
        AppNavigator.pushAndRemoveAll(
          transitionBuilder: AppNavigator.cupertinoTransition,
          screen: MainViewScreen(user: user),
        );
      },
    );
  }
}
