import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants.dart';
import '../cubits/companies/couriers_cubit.dart';
import '../widgets/companies_body.dart';

class CompaniesScreen extends StatelessWidget {
  const CompaniesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CompaniesCubit>()..initCompanies(),
      child: Scaffold(appBar: AppBar(), body: CompaniesBody()),
    );
  }
}
