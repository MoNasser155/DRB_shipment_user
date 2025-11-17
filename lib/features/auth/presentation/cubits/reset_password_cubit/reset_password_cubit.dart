import 'package:drb_shipment_user/core/widgets/custom_snack_bar.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/enums/state_status.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../domain/use_cases/reset_password_usecase.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordState.initial());

  static ResetPasswordCubit get(context) => BlocProvider.of(context);

  final _resetPasswordUsecase = sl<ResetPasswordUsecase>();

  final TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> resetPassword() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    emit(state.copyWith(status: StateStatus.loading));
    final result = await _resetPasswordUsecase.call(
      email: emailController.text,
    );
    result.fold(
      (failure) {
        emit(state.copyWith(status: StateStatus.error));
      },
      (sucess) {
        CustomSnackBar.top(
          msg: LocaleKeys.resetPasswordEmailHasBeenSentSuccessfully,
          color: Colors.green,
        );
        emit(state.copyWith(status: StateStatus.success));
      },
    );
  }
}
