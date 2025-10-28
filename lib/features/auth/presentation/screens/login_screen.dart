import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants.dart';
import '../cubits/login_cubit/login_cubit.dart';
import '../widgets/login/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginCubit>(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(),
        body: LoginBody(),
      ),
    );
  }
}
