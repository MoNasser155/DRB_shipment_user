import 'package:drb_shipment_user/features/packages/presentation/cubits/Packages/packages_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../widgets/packages_body.dart';

class PackagesScreen extends StatelessWidget {
  const PackagesScreen({super.key, required this.user});
final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PackagesCubit>()..initPackages(user ),
      child: Scaffold(appBar: AppBar(), body: PackagesBody()),
    );
  }
}
