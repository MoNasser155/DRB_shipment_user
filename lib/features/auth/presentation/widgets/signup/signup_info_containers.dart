import 'package:drb_shipment_user/core/shared/validations.dart';
import 'package:drb_shipment_user/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpers/spaceing_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../../core/widgets/textfield_withlabel.dart';
import '../custom_passfiled.dart';

class SignupInfoContainers extends StatelessWidget {
  const SignupInfoContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        final cubit = SignupCubit.get(context);
        return Form(
          key: cubit.formKey,
          child: Column(
            spacing: SpacingHelper.kVertical8,
            children: [
              TextFieldWithLabel(
                label: LocaleKeys.email,
                removeInit: true,
                hint: 'username@example.com',
                controller: cubit.emailController,
                validate: (val) {
                  return Validations.validateEmail(val);
                },
              ),
              TextFieldWithLabel(
                label: LocaleKeys.username,
                removeInit: true,
                hint: 'exampleusername',
                controller: cubit.userNameController,
                validate: (val) {
                  return Validations.validateEmpty(val);
                },
              ),
              TextFieldWithLabel(
                label: LocaleKeys.phoneNumber,
                removeInit: true,
                hint: '+1 000 000 0000',
                controller: cubit.phoneController,
                validate: (val) {
                  return Validations.validatePhone(val);
                },
              ),
              PassFieldWithLabel(
                label: LocaleKeys.password,
                removeInit: true,
                hint: '**********',
                controller: cubit.passwordController,
                validate: (val) {
                  return Validations.validatePassword(val);
                },
              ),
              PassFieldWithLabel(
                label: LocaleKeys.confirmPassword,
                removeInit: true,
                hint: '**********',
                controller: cubit.confirmPasswordController,
                validate: (val) {
                  return Validations.validateConfirmPassword(
                    val,
                    cubit.passwordController.text,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
