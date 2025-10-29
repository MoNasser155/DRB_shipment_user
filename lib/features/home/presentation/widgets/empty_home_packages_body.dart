
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/color_helper.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../../../core/themes/text_theme.dart';
import '../../../main_view/presentation/cubits/cubit/main_view_cubit.dart';

class EmptyHomePackagesBody extends StatelessWidget {
  const EmptyHomePackagesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SpacingHelper.kHorizontalPadding,
          vertical: SpacingHelper.kVertical12,
        ),
        child: InkWell(
          onTap: () {
            context.read<MainViewCubit>().setInitialTab(2);
          },
          child: Center(
            child: Column(
              children: [
                Icon(Icons.add, color: ColorHelper.primaryGreen, size: 56),
                Gap(SpacingHelper.kVertical12),
                Text(
                  LocaleKeys.addYourFirstPackage,
                  style: AppTextTheme.text16W500grey300,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
