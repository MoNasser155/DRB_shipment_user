import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'account_privacy_state.dart';

class AccountPrivacyCubit extends Cubit<AccountPrivacyState> {
  AccountPrivacyCubit() : super(AccountPrivacyInitial());

  final GlobalKey<FormState> fKey = GlobalKey();
  final TextEditingController oldpassController = TextEditingController();
  final TextEditingController newpassController = TextEditingController();
  final TextEditingController confirmpassController = TextEditingController();

  static AccountPrivacyCubit get(context) => BlocProvider.of(context);

  bool changePassword = false;
  bool oldpasswordHidden = true;
  bool newpasswordHidden = true;
  bool confirmpasswordHidden = true;

  startChangingPassword() {
    changePassword = !changePassword;
    emit(ChangingPasswordState());
  }

  oldpasswordVisibility() {
    oldpasswordHidden = !oldpasswordHidden;
    emit(PasswordVisibilityState());
  }

  newpasswordVisibility() {
    newpasswordHidden = !newpasswordHidden;
    emit(PasswordVisibilityState());
  }

  confirmpasswordVisibility() {
    confirmpasswordHidden = !confirmpasswordHidden;
    emit(PasswordVisibilityState());
  }

  updatePassword() async {}
}
