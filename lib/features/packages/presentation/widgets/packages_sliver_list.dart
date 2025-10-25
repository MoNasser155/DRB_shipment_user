import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/helpers/spaceing_helper.dart';
import 'packages_item.dart';

class PackagesSliverList extends StatelessWidget {
  const PackagesSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: SpacingHelper.kHorizontalPadding,
      ),
      sliver: SliverList.separated(
        itemBuilder: (context, index) {
          return PackagesItem();
        },
        separatorBuilder: (context, index) {
          return Gap(SpacingHelper.kVertical12);
        },
        itemCount: 15,
      ),
    );
  }
}
