import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import 'courier_card.dart';

class CouriersBody extends StatelessWidget {
  const CouriersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      slivers: [
        SliverGap(SpacingHelper.kVertical12),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: SpacingHelper.kHorizontalPadding,
          ),
          sliver: SliverList.separated(
            itemBuilder: (context, index) {
              return CourierCard();
            },
            separatorBuilder:
                (context, index) => Gap(SpacingHelper.kVertical12),
            itemCount: 15,
          ),
        ),
        SliverGap(kBottomNavigationBarHeight * 1.7),
      ],
    );
  }
}
