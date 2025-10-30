import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants.dart';
import '../cubits/couriers/couriers_cubit.dart';
import '../widgets/couriers_body.dart';

class CouriersScreen extends StatelessWidget {
  const CouriersScreen({super.key, required this.companyId});
  final String companyId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CouriersCubit>()..initCouriers(companyId),
      child: Scaffold(appBar: AppBar(), body: const CouriersBody()),
    );
  }
}
