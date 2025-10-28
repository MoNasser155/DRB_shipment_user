import 'package:drb_shipment_user/core/constants.dart';
import 'package:drb_shipment_user/core/enums/state_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/navigator_helper.dart';
import '../../../../main_view/presentation/screens/main_view_screen.dart';
import '../../../data/models/signup_params.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/use_cases/signup_usecase.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupState.initial());

  static SignupCubit get(context) => BlocProvider.of(context);

  final _signupUsecase = sl<SignupUsecase>();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignupParams signupParams() {
    return SignupParams(
      username: userNameController.text,
      email: emailController.text,
      phoneNumber: phoneController.text,
      password: passwordController.text,
    );
  }

  void handleNavigation(UserEntity user) {
    AppNavigator.pushReplacement(
      transitionBuilder: AppNavigator.cupertinoTransition,
      screen: MainViewScreen(user:user ),
    );
  }

  Future<void> signup() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    emit(state.copyWith(status: StateStatus.loading));

    final result = await _signupUsecase.call(signupParams());

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
        handleNavigation(user);
      },
    );
  }
}
