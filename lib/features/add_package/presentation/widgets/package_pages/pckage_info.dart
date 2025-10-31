import 'package:drb_shipment_user/core/shared/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../../core/themes/text_theme.dart';
import '../../../../../core/widgets/textfield_withlabel.dart';
import '../../cubits/cubit/add_package_cubit.dart';
import '../custom_package_column.dart';
import '../custom_radio_button.dart';

class PckageInfo extends StatelessWidget {
  const PckageInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPackageCubit, AddPackageState>(
      builder: (context, state) {
        final cubit = AddPackageCubit.get(context);

        return Form(
          key: cubit.packageInfoFormKey,
          child: CustomPackageColumn(
            children: [
              Center(
                child: Text(
                  LocaleKeys.packageDetails,
                  style: AppTextTheme.text18W600grey100,
                ),
              ),
              TextFieldWithLabel(
                label: LocaleKeys.packageContents,
                hint: 'A, B, C',
                scrollPhysics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                minLines: 1,
                maxLines: 5,
                controller: cubit.contentController,
                validate: (val) {
                  return Validations.validateEmpty(val);
                },
              ),
              TextFieldWithLabel(
                label: LocaleKeys.weight,
                hint: 'ex: 1.00 kg',
                maxLines: 1,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}$')),
                ],
                controller: cubit.weightController,
                inputType: const TextInputType.numberWithOptions(decimal: true),
                validate: (val) {
                  return Validations.validateEmpty(val);
                },
              ),
              Text(LocaleKeys.fragile, style: AppTextTheme.text10W500grey300),
              Row(
                children: [
                  Expanded(
                    child: CustomRadioButton<bool>(
                      value: true,
                      label: LocaleKeys.yes,
                      groupValue: state.isFragile,
                      onChanged: (val) {
                        cubit.setFragile(true);
                      },
                    ),
                  ),
                  Expanded(
                    child: CustomRadioButton<bool>(
                      value: false,
                      label: LocaleKeys.no,
                      groupValue: state.isFragile,
                      onChanged: (val) {
                        cubit.setFragile(false);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
