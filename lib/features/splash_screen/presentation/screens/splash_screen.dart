import 'package:drb_shipment_user/core/app_assets/images.dart';
import 'package:drb_shipment_user/core/extensions/buildcontext_extensions.dart';
import 'package:drb_shipment_user/core/helpers/spaceing_helper.dart';
import 'package:drb_shipment_user/features/splash_screen/presentation/cubits/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/languages/local_keys.g.dart';
import '../../../../core/themes/text_theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            bottom: false,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SpacingHelper.kHorizontalPadding,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset(
                          AppImages.appLogo,
                          width: context.width * 0.5,
                        ),
                        Gap(SpacingHelper.kVertical20),
                        Text(
                          LocaleKeys.splashKey,
                          style: AppTextTheme.text20W600grey100,
                        ),
                      ],
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
