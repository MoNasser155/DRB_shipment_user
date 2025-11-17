import 'package:drb_shipment_user/core/constants.dart';
import 'package:drb_shipment_user/core/enums/state_status.dart';
import 'package:drb_shipment_user/core/widgets/custom_snack_bar.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/color_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
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
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
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
      imageUrl: '',
      firstName: firstNameController.text,
      lastName: lastNameController.text,
    );
  }

  void handleNavigation(UserEntity user) {
    AppNavigator.pushReplacement(
      transitionBuilder: AppNavigator.cupertinoTransition,
      screen: MainViewScreen(user: user),
    );
  }

  void setIsTermsAccepted(bool value) {
    emit(state.copyWith(isTermsAccepted: value));
  }

  Future<void> signup() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    if (state.isTermsAccepted == false) {
      CustomSnackBar.top(
        msg: LocaleKeys.pleaseAcceptTermsAndConditions,
        color: ColorHelper.red,
      );
      return;
    }

    emit(state.copyWith(status: StateStatus.loading));

    final result = await _signupUsecase.call(signupParams());

    result.fold(
      (failure) {
        CustomSnackBar.top(msg: failure.message);
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

  @override
  Future<void> close() {
    userNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
