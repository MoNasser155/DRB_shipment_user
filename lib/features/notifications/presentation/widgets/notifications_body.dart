import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/color_helper.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../../../core/widgets/custom_appbar.dart';
import 'notification_item.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          surfaceTintColor: Colors.transparent,
          backgroundColor: ColorHelper.backgroundBlack,
          automaticallyImplyLeading: false,
          toolbarHeight: 56.h,
          flexibleSpace: CustomAppbar(
            title: LocaleKeys.companyInfo,
            applyPadding: true,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: SpacingHelper.kHorizontalPadding,
          ),
          sliver: SliverList.separated(
            itemBuilder: (context, index) {
              return NotificationItem();
            },
            separatorBuilder: (context, index) {
              return const Divider(
                height: 0,
                thickness: 0.5,
                color: ColorHelper.grey400,
                endIndent: 30,
                indent: 30,
              );
            },
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
