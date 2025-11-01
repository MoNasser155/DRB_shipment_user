import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../core/color_helper.dart';
import '../../../../../core/helpers/spaceing_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../widgets/manage_notification_chip.dart';

class ManageNotificationsScreen extends StatelessWidget {
  const ManageNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            backgroundColor: ColorHelper.backgroundBlack,
            flexibleSpace: CustomAppbar(
              title: LocaleKeys.notifications,
              applyPadding: true,
            ),
          ),
          SliverGap(SpacingHelper.kVertical12),
          SliverToBoxAdapter(child: ManageNotificationChip()),
        ],
      ),
    );
  }
}
