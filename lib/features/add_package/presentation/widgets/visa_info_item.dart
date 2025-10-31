import 'package:drb_shipment_user/features/add_package/presentation/cubits/cubit/add_package_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/color_helper.dart';
import '../../../../core/enums/payment.dart';
import '../../../../core/helpers/redius_helper.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../../../core/shared/validations.dart';
import '../../../../core/themes/text_theme.dart';
import '../../../../core/widgets/custom_text_field.dart';

class VisaInfoItem extends StatelessWidget {
  const VisaInfoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPackageCubit, AddPackageState>(
      buildWhen:
          (previous, current) =>
              previous.selectedPaymentMethod != current.selectedPaymentMethod,
      builder: (context, state) {
        return Visibility(
          visible: state.selectedPaymentMethod == Payment.visa,
          child: Column(
            spacing: SpacingHelper.kVertical8,
            children: [
              Gap(SpacingHelper.kVertical20),
              Center(
                child: Text(
                  LocaleKeys.visaInfo,
                  style: AppTextTheme.text18W600grey100,
                ),
              ),
              CustomTextField(
                hint: LocaleKeys.cardNumber,
                maxLength: 16,
                inputType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validate: (val) {
                  return Validations.validateVisa(val);
                },
              ),
              CustomTextField(
                hint: LocaleKeys.cardHolderName,
                validate: (val) {
                  return Validations.validateEmpty(val);
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomTextField(
                      hint: LocaleKeys.cVV,
                      textAlign: TextAlign.center,
                      maxLength: 3,
                      inputType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validate: (val) {
                        return Validations.validateCvv(val);
                      },
                    ),
                  ),
                  Gap(SpacingHelper.horizontal8),
                  Expanded(
                    flex: 3,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(
                        RadiusHelper.kRadius8,
                      ),
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: SpacingHelper.horizontal8,
                          vertical: SpacingHelper.kVertical12,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorHelper.grey400,
                            width: 1,
                          ),

                          borderRadius: BorderRadius.circular(
                            RadiusHelper.kRadius8,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_month_outlined,
                              color: ColorHelper.primaryGreen,
                            ),
                            Gap(SpacingHelper.horizontal8),
                            Text(
                              '01/25',
                              style: AppTextTheme.text10W500grey300,
                            ),
                          ],
                        ),
                      ),
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
