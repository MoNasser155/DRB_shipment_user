
import 'package:drb_shipment_user/core/extensions/buildcontext_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/app_assets/images.dart';
import '../../../../core/color_helper.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../../../core/themes/text_theme.dart';
import '../../../main_view/presentation/cubits/cubit/main_view_cubit.dart';

class EmptyPcakagesBody extends StatelessWidget {
  const EmptyPcakagesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: SpacingHelper.kHorizontalPadding,
      ),
      sliver: SliverToBoxAdapter(
        child: InkWell(
          onTap: () {
            context.read<MainViewCubit>().setInitialTab(2);
          },
          child: Column(
            children: [
              Gap(context.height * 0.25),
              SvgPicture.asset(
                AppImages.emptyPackages,
                height: context.height * 0.25,
              ),
              Gap(context.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.addYourFirstPackage,
                    style: AppTextTheme.nonlineText14White.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  Gap(SpacingHelper.horizontal4),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: ColorHelper.white,
                    size: 18,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
