import 'package:drb_shipment_user/features/companies/presentation/cubits/company_details/company_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../../core/color_helper.dart';
import '../../../../../core/helpers/redius_helper.dart';
import '../../../../../core/helpers/spaceing_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../../core/themes/text_theme.dart';

class CompanyInfoSection extends StatelessWidget {
  const CompanyInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SpacingHelper.kHorizontalPadding,
        ),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: ColorHelper.grey100.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(RadiusHelper.kRadius8),
          ),
          child: BlocBuilder<CompanyDetailsCubit, CompanyDetailsState>(
            buildWhen: (previous, current) {
              return previous.companyModel != current.companyModel;
            },
            builder: (context, state) {
              final company = state.companyModel;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${LocaleKeys.companyName}: ',
                        style: AppTextTheme.text16W500grey100,
                      ),
                      Text(company.name, style: AppTextTheme.text16W500grey100),
                      Spacer(),
                      Text(
                        company.rating.toString(),
                        style: AppTextTheme.text14W500grey300.copyWith(
                          color: ColorHelper.grey100,
                        ),
                      ),
                      Gap(SpacingHelper.horizontal4),
                      Icon(Icons.star, color: ColorHelper.yellow, size: 16),
                    ],
                  ),
                  Gap(SpacingHelper.kVertical4),
                  Row(
                    children: [
                      Text(
                        '${LocaleKeys.companyEmail}:',
                        style: AppTextTheme.text14W500grey300,
                      ),
                      Gap(SpacingHelper.horizontal4),
                      Text(
                        company.email,
                        style: AppTextTheme.text14W500grey300,
                      ),
                    ],
                  ),
                  Gap(SpacingHelper.kVertical4),
                  Row(
                    children: [
                      Text(
                        '${LocaleKeys.companyPhone}:',
                        style: AppTextTheme.text14W500grey300,
                      ),
                      Gap(SpacingHelper.horizontal4),
                      Text(
                        company.phone,
                        style: AppTextTheme.text14W500grey300,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
