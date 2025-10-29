import 'package:drb_shipment_user/features/add_package/presentation/cubits/cubit/add_package_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../widgets/add_new_package_body.dart';

class AddNewPackageScreen extends StatelessWidget {
  const AddNewPackageScreen({super.key, required this.user});
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AddPackageCubit>()..initAddPackage(user),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(),
        body: AddNewPackageBody(),
      ),
    );
  }
}
