import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/cubit/add_package_cubit.dart';
import '../custom_package_column.dart';

class CompanyCourierSelection extends StatelessWidget {
  const CompanyCourierSelection({super.key});

  @override
  Widget build(BuildContext context) {
   return BlocBuilder<AddPackageCubit, AddPackageState>(
      buildWhen:
          (previous, current) =>
              previous.status != current.status ||
              previous.dropoffLocation != current.dropoffLocation,
      builder: (context, state) {
        final cubit = AddPackageCubit.get(context);
        return CustomPackageColumn(
          children: [
           
          ],
        );
      },
    );
  }
}
