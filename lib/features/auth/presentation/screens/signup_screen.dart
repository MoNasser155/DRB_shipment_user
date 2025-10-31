import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants.dart';
import '../cubits/signup_cubit/signup_cubit.dart';
import '../widgets/signup/signup_body.dart';
import '../widgets/signup/signup_bottom_sheet.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SignupCubit>(),
      child: Scaffold(
        key: ValueKey(context.locale.toString()),
        resizeToAvoidBottomInset: true,
        appBar: AppBar(),
        bottomSheet: SignupBottomSheet(),
        body: SignupBody(),
      ),
    );
  }
}
