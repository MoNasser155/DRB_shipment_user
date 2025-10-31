import 'package:drb_shipment_user/core/helpers/spaceing_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/enums/state_status.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../../../core/themes/text_theme.dart';
import '../../../../core/widgets/cutsom_button.dart';
import '../cubits/cubit/add_package_cubit.dart';

class AddPackageNavigationBottom extends StatelessWidget {
  const AddPackageNavigationBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SpacingHelper.kHorizontalPadding,
        vertical: SpacingHelper.kVerticalPadding,
      ),
      child: BlocBuilder<AddPackageCubit, AddPackageState>(
        buildWhen: (previous, current) {
          return previous.currentPageIndex != current.currentPageIndex ||
              previous.status != current.status;
        },
        builder: (context, state) {
          final cubit = AddPackageCubit.get(context);
          return Row(
            children: [
              Visibility(
                visible: state.currentPageIndex != 0,
                child: Expanded(
                  child: CustomButton(
                    onTap: () {
                      state.currentPageIndex == cubit.pages.length - 1 &&
                              state.status == StateStatus.loading
                          ? null
                          : cubit.previousPage();
                    },
                    buttonChild: Text(
                      LocaleKeys.previous,
                      style: AppTextTheme.buttonTextStyle,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: state.currentPageIndex != 0,
                child: Gap(SpacingHelper.horizontal8),
              ),
              Expanded(
                child: CustomButton(
                  onTap: () {
                    state.currentPageIndex == cubit.pages.length - 1 &&
                            state.status == StateStatus.loading
                        ? null
                        : cubit.nextPage();
                  },
                  buttonChild:
                      state.currentPageIndex == cubit.pages.length - 1 &&
                              state.status == StateStatus.loading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
                            LocaleKeys.next,
                            style: AppTextTheme.buttonTextStyle,
                          ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
