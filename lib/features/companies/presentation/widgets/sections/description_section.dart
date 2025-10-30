import 'package:drb_shipment_user/core/languages/languages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../../core/color_helper.dart';
import '../../../../../core/helpers/redius_helper.dart';
import '../../../../../core/helpers/spaceing_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../../core/themes/text_theme.dart';
import '../../cubits/company_details/company_details_cubit.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SpacingHelper.kHorizontalPadding,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: ColorHelper.grey100.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(RadiusHelper.kRadius8),
          ),
          padding: EdgeInsets.all(8),
          child: BlocBuilder<CompanyDetailsCubit, CompanyDetailsState>(
            buildWhen: (previous, current) {
              return previous.companyModel != current.companyModel ||
                  previous.maxDescriptionLines != current.maxDescriptionLines;
            },
            builder: (context, state) {
              final cubit = CompanyDetailsCubit.get(context);
              return Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.companyDescription,
                        style: AppTextTheme.text18W600grey100,
                      ),
                      Gap(SpacingHelper.kVertical4),
                      Text(
                        state.companyModel.description,
                        style: AppTextTheme.text14W500grey300,
                        overflow: TextOverflow.ellipsis,
                        maxLines: state.maxDescriptionLines,
                      ),
                    ],
                  ),

                  Visibility(
                    visible:
                        state.maxDescriptionLines == 2 &&
                        state.companyModel.description.length > 200,
                    child: Positioned(
                      bottom: 0,
                      right: Languages.currentLanguage.isArabic ? null : 0,
                      left: Languages.currentLanguage.isEnglish ? null : 0,
                      child: InkWell(
                        radius: RadiusHelper.kRadius8,
                        onTap: () {
                          cubit.updateMaxLines(20);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: RadialGradient(
                              radius: 3.0,
                              colors: [
                                ColorHelper.backgroundBlack.withValues(
                                  alpha: 0.7,
                                ),
                                Colors.transparent,
                              ],
                            ),
                          ),
                          child: Text(
                            LocaleKeys.viewMore,
                            style: AppTextTheme.text12W500grey500.copyWith(
                              color: ColorHelper.primaryGreen,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible:
                        state.maxDescriptionLines == 20 &&
                        state.companyModel.description.length > 200,
                    child: Positioned(
                      bottom: 0,
                      right: Languages.currentLanguage.isArabic ? null : 0,
                      left: Languages.currentLanguage.isEnglish ? null : 0,
                      child: InkWell(
                        radius: RadiusHelper.kRadius8,
                        onTap: () {
                          cubit.updateMaxLines(2);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: RadialGradient(
                              radius: 3.0,
                              colors: [
                                ColorHelper.backgroundBlack.withValues(
                                  alpha: 0.7,
                                ),
                                Colors.transparent,
                              ],
                            ),
                          ),
                          child: Text(
                            LocaleKeys.viewLess,
                            style: AppTextTheme.text12W500grey500.copyWith(
                              color: ColorHelper.primaryGreen,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ),
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
