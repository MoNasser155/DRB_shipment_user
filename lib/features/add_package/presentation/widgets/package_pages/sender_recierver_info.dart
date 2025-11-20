import 'package:drb_shipment_user/core/shared/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../../core/themes/text_theme.dart';
import '../../../../../core/widgets/textfield_withlabel.dart';
import '../../cubits/cubit/add_package_cubit.dart';
import '../custom_package_column.dart';

class RecierverInfo extends StatelessWidget {
  const RecierverInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPackageCubit, AddPackageState>(
      builder: (context, state) {
        final cubit = AddPackageCubit.get(context);
        return Form(
          key: cubit.recieverInfoFormKey,
          child: CustomPackageColumn(
            children: [
              Center(
                child: Text(
                  LocaleKeys.receiverInfo,
                  style: AppTextTheme.text18W600grey100,
                ),
              ),
              TextFieldWithLabel(
                label: LocaleKeys.name,
                hint: LocaleKeys.name,
                controller: cubit.recieverNameController,
                validate: (value) {
                  return Validations.validateEmpty(value);
                },
              ),
              TextFieldWithLabel(
                label: LocaleKeys.phoneNumber,
                hint: LocaleKeys.phoneNumber,
                controller: cubit.recieverPhoneNumberController,
                inputType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validate: (value) {
                  return Validations.validatePhone(value);
                },
              ),
              TextFieldWithLabel(
                label: LocaleKeys.email,
                hint: LocaleKeys.email,
                controller: cubit.recieverEmailController,
                validate: (value) {
                  return Validations.validateEmail(value);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
