import 'package:drb_shipment_user/core/widgets/custom_text_field.dart';
import 'package:drb_shipment_user/core/widgets/cutsom_button.dart';
import 'package:drb_shipment_user/core/widgets/default_sheet_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/color_helper.dart';
import '../../../../core/enums/state_status.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../../../core/shared/validations.dart';
import '../../../../core/themes/text_theme.dart';
import '../../../packages/presentation/cubits/package_details/package_details_cubit.dart';

class AddReviewBottomSheet extends StatelessWidget {
  const AddReviewBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultSheetBody(
      child: BlocBuilder<PackageDetailsCubit, PackageDetailsState>(
        buildWhen:
            (previous, current) =>
                previous.status != current.status ||
                previous.rating != current.rating,
        builder: (context, state) {
          final cubit = PackageDetailsCubit.get(context);
          return Form(
            key: cubit.formKey,
            child: Column(
              spacing: SpacingHelper.kVertical20,
              children: [
                Container(
                  width: 80.w,
                  height: 6.h,
                  decoration: BoxDecoration(
                    color: ColorHelper.primaryGreen,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Text(
                  LocaleKeys.addReview,
                  style: AppTextTheme.text18W600grey100,
                ),

                Center(
                  child: Text(
                    LocaleKeys.rate,
                    style: AppTextTheme.text16W500grey300,
                  ),
                ),
                RatingBar(
                  onRatingChanged: (value) {
                    cubit.setRating(value);
                  },
                  rating: state.rating,
                  allowHalfRating: true,
                  maxRating: 5,
                ),
                CustomTextField(
                  hint: LocaleKeys.comment,
                  minlines: 1,
                  maxlines: 5,
                  controller: cubit.reviewController,
                  validate: (val) {
                    return Validations.validateEmpty(val!);
                  },
                ),
                Gap(0),
                CustomButton(
                  isLaoding: state.status == StateStatus.loading,
                  buttonChild: Text(
                    LocaleKeys.add,
                    style: AppTextTheme.buttonTextStyle,
                  ),
                  onTap: () {
                    cubit.addReview();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  const RatingBar({
    super.key,
    this.rating = 0,
    this.maxRating = 5,
    this.size = 24.0,
    this.color = Colors.amber,
    this.unratedColor = Colors.grey,
    this.spacing = 4.0,
    this.onRatingChanged,
    this.allowHalfRating = false,
    this.showRatingValue = true,
    this.ratingTextStyle,
  });

  final double rating;
  final int maxRating;
  final double size;
  final Color color;
  final Color unratedColor;
  final double spacing;
  final ValueChanged<double>? onRatingChanged;
  final bool allowHalfRating;
  final bool showRatingValue;
  final TextStyle? ratingTextStyle;

  @override
  Widget build(BuildContext context) {
    // Check if the app is in RTL mode
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
          children: List.generate(maxRating, (index) {
            return Padding(
              padding: EdgeInsets.only(
                left: isRTL && index < maxRating - 1 ? spacing : 0,
                right: !isRTL && index < maxRating - 1 ? spacing : 0,
              ),
              child: GestureDetector(
                onTap:
                    onRatingChanged != null
                        ? () => onRatingChanged!(index + 1.0)
                        : null,
                onHorizontalDragUpdate:
                    onRatingChanged != null && allowHalfRating
                        ? (details) {
                          RenderBox box =
                              context.findRenderObject() as RenderBox;
                          double localX =
                              box.globalToLocal(details.globalPosition).dx;
                          double starWidth = size + spacing;

                          // For RTL, calculate from right to left
                          if (isRTL) {
                            localX = box.size.width - localX;
                          }

                          double newRating = (localX / starWidth).clamp(
                            0.0,
                            maxRating.toDouble(),
                          );

                          if (allowHalfRating) {
                            newRating = (newRating * 2).roundToDouble() / 2;
                          } else {
                            newRating = newRating.ceilToDouble();
                          }

                          onRatingChanged!(newRating);
                        }
                        : null,
                child: _buildStar(index + 1),
              ),
            );
          }),
        ),
        if (showRatingValue) ...[
          const SizedBox(height: 8),
          Text(
            '${rating.toStringAsFixed(1)} / $maxRating',
            style:
                ratingTextStyle ??
                TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
          ),
        ],
      ],
    );
  }

  Widget _buildStar(int position) {
    IconData icon;
    Color starColor;

    if (position <= rating.floor()) {
      // Full star
      icon = Icons.star;
      starColor = color;
    } else if (position == rating.ceil() && rating % 1 != 0) {
      // Half star
      icon = Icons.star_half;
      starColor = color;
    } else {
      // Empty star
      icon = Icons.star_border;
      starColor = unratedColor;
    }

    return Icon(icon, size: size, color: starColor);
  }
}
