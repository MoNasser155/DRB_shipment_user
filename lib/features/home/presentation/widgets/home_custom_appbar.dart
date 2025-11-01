import 'package:drb_shipment_user/features/home/presentation/cubits/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../../core/app_assets/icons.dart';
import '../../../../core/color_helper.dart';
import '../../../../core/helpers/redius_helper.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/themes/text_theme.dart';
import '../../../../core/utils/navigator_helper.dart';
import '../../../../core/widgets/custom_cached_image.dart';
import '../../../notifications/presentation/screens/notifications_screen.dart';

class HomeCustomAppbar extends StatelessWidget {
  const HomeCustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        return previous.user != current.user || previous.date != current.date;
      },
      builder: (context, state) {
        return SliverAppBar(
          pinned: true,
          floating: true,
          snap: true,
          surfaceTintColor: Colors.transparent,
          toolbarHeight: 48.h,
          flexibleSpace: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SpacingHelper.kHorizontalPadding,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: SpacingHelper.horizontal4,
                    vertical: SpacingHelper.kVertical4,
                  ),
                  constraints: BoxConstraints(maxHeight: 40.h),
                  decoration: BoxDecoration(
                    color: ColorHelper.grey100.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(RadiusHelper.kRadius6),
                  ),
                  child: Row(
                    children: [
                      CustomCachedImage(),
                      Gap(SpacingHelper.horizontal8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.user.usreName,
                            style: AppTextTheme.text14W500grey300,
                          ),
                          Text(
                            state.date,
                            style: AppTextTheme.text12W500grey500,
                          ),
                        ],
                      ),
                      Gap(SpacingHelper.horizontal8),
                    ],
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    AppNavigator.push(
                      transitionBuilder: AppNavigator.cupertinoTransition,
                      screen: NotificationsScreen(),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: SpacingHelper.horizontal8,
                      vertical: SpacingHelper.kVertical8,
                    ),
                    height: 40.h,
                    width: 40.h,
                    decoration: BoxDecoration(
                      color: ColorHelper.grey100.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(
                        RadiusHelper.kRadius6,
                      ),
                    ),
                    child: SvgPicture.asset(
                      AppIcons.notifications,
                      colorFilter: ColorFilter.mode(
                        ColorHelper.primaryGreen,
                        BlendMode.srcIn,
                      ),
                    ),
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
