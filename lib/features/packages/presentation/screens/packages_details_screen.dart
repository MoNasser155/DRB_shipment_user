import 'dart:developer';

import 'package:drb_shipment_user/features/packages/data/models/packages_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants.dart';
import '../cubits/package_details/package_details_cubit.dart';
import '../widgets/packages_details_body.dart';

class PackagesDetailsScreen extends StatelessWidget {
  const PackagesDetailsScreen({super.key, required this.packageData});
  final PackagesModel packageData;
  @override
  Widget build(BuildContext context) {
    log(packageData.toJson().toString());
    return BlocProvider(
      create:
          (context) =>
              sl<PackageDetailsCubit>()..initPackageDetails(packageData),
      child: Scaffold(appBar: AppBar(), body: PackagesDetailsBody()),
    );
  }
}

