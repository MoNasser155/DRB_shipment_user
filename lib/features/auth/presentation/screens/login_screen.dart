import 'package:drb_shipment_user/features/auth/presentation/widgets/login/custom_login_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
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
        key: ValueKey(context.locale.toString()),
        resizeToAvoidBottomInset: true,
        appBar: AppBar(),
        bottomSheet: CustomLoginBottomSheet(),
        body: LoginBody(),
      ),
    );
  }
}
