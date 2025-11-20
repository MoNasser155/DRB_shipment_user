import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../../core/widgets/expanded_drop_down.dart';
import '../../cubits/cubit/add_package_cubit.dart';
import '../custom_package_column.dart';

class CompanyCourierSelection extends StatelessWidget {
  const CompanyCourierSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPackageCubit, AddPackageState>(
      buildWhen:
          (previous, current) =>
              previous.couriers != current.couriers ||
              previous.selectedCompany != current.selectedCompany,
      builder: (context, state) {
        final cubit = AddPackageCubit.get(context);
        return CustomPackageColumn(
          children: [
            ExpandedDropdown(
              hint: LocaleKeys.companies,
              items: state.companies,
              itemLabelBuilder: (item) => item.name,
              onChanged: (value) {
                cubit.setSelectedCompany(value!);
              },
              selectedValue: state.selectedCompany.name,
            ),
            Gap(12),
            ExpandedDropdown(
              hint:
                  state.selectedCompany.name == ''
                      ? LocaleKeys.selectCompanyFirst
                      : LocaleKeys.couriers,
              items: state.couriers,
              itemLabelBuilder: (item) => item.name,
              onChanged: (value) {
                cubit.setSelectedCourier(value!);
              },
            ),
          ],
        );
      },
    );
  }
}
