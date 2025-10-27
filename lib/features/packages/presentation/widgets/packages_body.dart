import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import 'packages_custom_appbar.dart';
import 'packages_sliver_list.dart';

class PackagesBody extends StatelessWidget {
  const PackagesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      slivers: [
        SliverGap(SpacingHelper.kVertical12),
        PackagesCustomAppbar(),
        SliverGap(SpacingHelper.kVertical12),
        PackagesSliverList(),
        SliverGap(kBottomNavigationBarHeight * 1.7),
      ],
    );
  }
}
