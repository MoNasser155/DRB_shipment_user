import 'package:cached_network_image/cached_network_image.dart';
import 'package:drb_shipment_user/core/helpers/redius_helper.dart';
import 'package:drb_shipment_user/core/languages/languages.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../core/color_helper.dart';
import '../../../../core/themes/text_theme.dart';

class PopularCourierItem extends StatelessWidget {
  const PopularCourierItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: ColorHelper.grey100.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(RadiusHelper.kRadius12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(RadiusHelper.kRadius8),
                child: CachedNetworkImage(
                  imageUrl:
                      "https://i.pinimg.com/736x/d3/e7/0d/d3e70d89e5bfbe3b18c4ccdb6901d7df.jpg",
                  width: 100,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    color: ColorHelper.backgroundBlack.withValues(alpha: 0.94),
                    borderRadius: BorderRadius.only(
                      topLeft:
                          Languages.currentLanguage.languageCode == 'ar'
                              ? Radius.circular(0)
                              : Radius.circular(RadiusHelper.kRadius8),

                      topRight:
                          Languages.currentLanguage.languageCode == 'en'
                              ? Radius.circular(0)
                              : Radius.circular(RadiusHelper.kRadius8),
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
                      Text('4.8', style: AppTextTheme.text10W500grey300),
                      Gap(4),
                      Icon(Icons.star, size: 14, color: Colors.amberAccent),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Gap(8),
          Text("DHL", style: AppTextTheme.text14W500grey400),
        ],
      ),
    );
  }
}
