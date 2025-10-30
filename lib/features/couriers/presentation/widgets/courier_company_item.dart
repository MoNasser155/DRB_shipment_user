import 'package:drb_shipment_user/core/helpers/redius_helper.dart';
import 'package:drb_shipment_user/core/helpers/spaceing_helper.dart';
import 'package:drb_shipment_user/core/languages/languages.dart';
import 'package:drb_shipment_user/core/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../core/color_helper.dart';
import '../../../../core/themes/text_theme.dart';
import '../../data/models/couriers_company_model.dart';

class CourierCompanyItem extends StatelessWidget {
  const CourierCompanyItem({
    super.key,
    required this.couriersCompanyModel,
    this.height,
    this.width,
  });
  final CouriersCompanyModel couriersCompanyModel;
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SpacingHelper.horizontal4,
        vertical: SpacingHelper.kVertical4,
      ),
      decoration: BoxDecoration(
        color: ColorHelper.grey100.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(RadiusHelper.kRadius8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(RadiusHelper.kRadius6),
                  child: CustomCachedImage(
                    imageUrl: couriersCompanyModel.imageUrl,

                    width: width ?? 100,
                    height: height ?? 80,
                  ),
                ),
                Positioned(
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 52,
                      maxHeight: 32,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      color: ColorHelper.backgroundBlack.withValues(
                        alpha: 0.94,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft:
                            Languages.currentLanguage.languageCode == 'ar'
                                ? Radius.circular(0)
                                : Radius.circular(RadiusHelper.kRadius6 - 0.5),

                        topRight:
                            Languages.currentLanguage.languageCode == 'en'
                                ? Radius.circular(0)
                                : Radius.circular(RadiusHelper.kRadius6 - 0.5),
                        bottomLeft:
                            Languages.currentLanguage.languageCode == 'ar'
                                ? Radius.circular(RadiusHelper.kRadius12)
                                : Radius.circular(0),
                        bottomRight:
                            Languages.currentLanguage.languageCode == 'en'
                                ? Radius.circular(RadiusHelper.kRadius12)
                                : Radius.circular(0),
                      ),
                    ),

                    child: Row(
                      children: [
                        Text(
                          couriersCompanyModel.rating.toString(),
                          style: AppTextTheme.text10W500grey300,
                        ),
                        Gap(4),
                        Icon(Icons.star, size: 14, color: Colors.amberAccent),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gap(SpacingHelper.kVertical8),
          Text(
            couriersCompanyModel.name,
            style: AppTextTheme.text14W500grey400,
          ),
          Gap(SpacingHelper.kVertical4),
        ],
      ),
    );
  }
}
