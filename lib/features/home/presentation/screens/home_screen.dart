import 'package:drb_shipment_user/features/auth/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants.dart';
import '../cubits/cubit/home_cubit.dart';
import '../widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.user});
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>()..initHome(user),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(),
        body: HomeBody(),
      ),
    );
  }
}
