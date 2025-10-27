import 'package:drb_shipment_user/features/packages/presentation/cubits/cubit/packages_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants.dart';
import '../widgets/packages_body.dart';

class PackagesScreen extends StatelessWidget {
  const PackagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PackagesCubit>(),
      child: Scaffold(appBar: AppBar(), body: PackagesBody()),
    );
  }
}
