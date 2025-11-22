import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../../core/color_helper.dart';
import '../../../../../core/helpers/spaceing_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../../core/themes/text_theme.dart';
import '../../../../reviews/presentation/widgets/add_review_bottom_sheet.dart';
import '../../cubits/package_details/package_details_cubit.dart';

class PackageDetailsReviewSection extends StatelessWidget {
  const PackageDetailsReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PackageDetailsCubit, PackageDetailsState>(
      buildWhen:
          (previous, current) =>
              previous.review != current.review ||
              previous.status != current.status,
      builder: (context, state) {
        log(
          '-------------------------------------- ${state.review.toFirestore()}',
        );
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: SpacingHelper.kVertical8,
          children: [
            Text(LocaleKeys.review, style: AppTextTheme.text16W500grey100),
            state.packagesModel.reviewId == null ||
                    state.packagesModel.reviewId == ''
                ? Center(
                  child: InkWell(
                    onTap: () {
                      final cubit = context.read<PackageDetailsCubit>();
                      showModalBottomSheet(
                        context: context,
                        builder:
                            (bottomSheetContext) => BlocProvider.value(
                              value: cubit,
                              child: const AddReviewBottomSheet(),
                            ),
                      );
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.add,
                          color: ColorHelper.primaryGreen,
                          size: 56,
                        ),
                        Gap(SpacingHelper.kVertical8),
                        Text(
                          '${LocaleKeys.add} ${LocaleKeys.review}',
                          style: AppTextTheme.text16W500grey100,
                        ),
                      ],
                    ),
                  ),
                )
                : Row(
                  children: [
                    Text(
                      state.review.comment,
                      style: AppTextTheme.text16W500grey100,
                    ),
                    Spacer(),
                    Text(
                      state.review.rating.toStringAsFixed(1),
                      style: AppTextTheme.text16W500grey100,
                    ),
                    Gap(SpacingHelper.horizontal4),
                    Icon(Icons.star, color: ColorHelper.primaryGreen, size: 20),
                  ],
                ),
            Gap(SpacingHelper.kVertical20),
          ],
        );
      },
    );
  }
}
