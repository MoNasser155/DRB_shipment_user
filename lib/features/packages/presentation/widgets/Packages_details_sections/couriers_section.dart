import 'package:drb_shipment_user/core/utils/navigator_helper.dart';
import 'package:drb_shipment_user/core/widgets/custom_cached_image.dart';
import 'package:drb_shipment_user/core/widgets/custom_skeletonizer.dart';
import 'package:drb_shipment_user/features/couriers/presentation/screens/courier_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../core/color_helper.dart';
import '../../../../../core/enums/state_status.dart';
import '../../../../../core/helpers/spaceing_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../../core/themes/text_theme.dart';
import '../../../../companies/data/models/company_model.dart';
import '../../../../companies/presentation/screens/company_details_screen.dart';
import '../../../../couriers/data/models/courier_model.dart';
import '../../cubits/package_details/package_details_cubit.dart';

class PackageDetailsCourierSection extends StatelessWidget {
  const PackageDetailsCourierSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PackageDetailsCubit, PackageDetailsState>(
      buildWhen:
          (previous, current) =>
              previous.courier != current.courier ||
              previous.company != current.company,
      builder: (context, state) {
        final courier =
            state.status == StateStatus.loading
                ? CourierModel.skeleton()
                : state.courier;
        final company =
            state.status == StateStatus.loading
                ? CompanyModel.skeleton()
                : state.company;
        return Visibility(
          visible:
              state.status == StateStatus.success ||
              state.courier.id != '' ||
              state.company.id != '',
          child: CustomSkeletonizer(
            enabled: state.status == StateStatus.loading,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: SpacingHelper.kVertical8,
              children: [
                Text(
                  LocaleKeys.courierInfo,
                  style: AppTextTheme.text18W600grey100,
                ),

                InkWell(
                  onTap: () {
                    state.status == StateStatus.loading
                        ? null
                        : AppNavigator.push(
                          transitionBuilder: AppNavigator.cupertinoTransition,
                          screen: CourierDetailsScreen(couriersModel: courier),
                        );
                  },
                  child: Row(
                    children: [
                      CustomCachedImage(
                        radius: 24.r,
                        width: 56,
                        height: 56,
                        imageUrl: courier.imageUrl,
                      ),
                      Gap(SpacingHelper.horizontal8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${courier.name} - ',
                                style: AppTextTheme.text16W500grey100,
                              ),
                              InkWell(
                                onTap: () {
                                  state.status == StateStatus.loading
                                      ? null
                                      : AppNavigator.push(
                                        transitionBuilder:
                                            AppNavigator.cupertinoTransition,
                                        screen: CompanyDetailsScreen(
                                          companyModel: company,
                                        ),
                                      );
                                },
                                child: Text(
                                  company.name,
                                  style: AppTextTheme.text16W500grey100
                                      .copyWith(
                                        color: ColorHelper.secondryOrange,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Gap(SpacingHelper.kVertical4),
                          Row(
                            children: [
                              Icon(
                                Icons.phone_android,
                                color: ColorHelper.primaryGreen,
                                size: 18,
                              ),
                              Gap(SpacingHelper.horizontal4),
                              Text(
                                courier.phone,
                                style: AppTextTheme.text14W500grey400,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Icon(Icons.star, color: ColorHelper.yellow, size: 18),
                          Gap(SpacingHelper.horizontal4),
                          Text(
                            courier.rating.toString(),
                            style: AppTextTheme.text16W500grey100,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
