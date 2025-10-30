import 'package:drb_shipment_user/features/companies/data/models/company_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants.dart';
import '../cubits/company_details/company_details_cubit.dart';
import '../widgets/company_details_body.dart';

class CompanyDetailsScreen extends StatelessWidget {
  const CompanyDetailsScreen({super.key, required this.companyModel});
  final CompanyModel companyModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CompanyDetailsCubit>()..initCompanyDetails(companyModel),
      child: Scaffold(appBar: AppBar(), body: CompanyDetailsBody()),
    );
  }
}
