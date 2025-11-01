import 'package:drb_shipment_user/core/color_helper.dart';
import 'package:drb_shipment_user/core/extensions/buildcontext_extensions.dart';
import 'package:drb_shipment_user/core/helpers/spaceing_helper.dart';
import 'package:drb_shipment_user/core/widgets/switch_lang_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/app_assets/images.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../data/models/about_us_content.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final aboutUsData = AboutUsContent.getAboutUsData();

    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),

        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            automaticallyImplyLeading: false,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            flexibleSpace: CustomAppbar(
              title: LocaleKeys.aboutUs,
              applyPadding: true,
              suffix: SwitchLangButton(isShorten: true),
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SpacingHelper.kHorizontalPadding,
              ),
              child: Column(
                children: [
                  Spacer(),
                  Image.asset(AppImages.appLogo, width: context.width / 1.5),
                  Gap(context.height / 7),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32.r),
                        topRight: Radius.circular(32.r),
                      ),
                      color: ColorHelper.grey100.withValues(alpha: 0.05),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 16.w,
                        left: 16.w,
                        bottom: 16.h,
                        top: 16.h,
                      ),
                      child: ListView(
                        physics: const AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics(),
                        ),
                        shrinkWrap: true,
                        children: [
                          Text(
                            aboutUsData[0]['content'] ?? '',
                            style: context.theme.textTheme.bodyMedium,
                            textAlign: TextAlign.start,
                          ),
                          Gap(16.h),
                          Text(
                            aboutUsData[1]['content'] ?? '',
                            style: context.theme.textTheme.bodyMedium,
                            textAlign: TextAlign.start,
                          ),
                          Gap(16.h),
                          Text(
                            aboutUsData[2]['content'] ?? '',
                            style: context.theme.textTheme.bodyMedium,
                            textAlign: TextAlign.start,
                          ),
                          Gap(16.h),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
