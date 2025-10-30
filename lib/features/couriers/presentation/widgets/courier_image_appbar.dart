
import 'package:drb_shipment_user/core/extensions/buildcontext_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/color_helper.dart';
import '../../../../core/widgets/custom_cached_image.dart';

class CourierImageAppbar extends StatelessWidget {
  const CourierImageAppbar({
    super.key,
    required this.imageUrl,
  });
final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      shadowColor: ColorHelper.grey100,
      scrolledUnderElevation: 10,
      surfaceTintColor: Colors.transparent,
      backgroundColor: ColorHelper.backgroundBlack,
      automaticallyImplyLeading: false,
      toolbarHeight: context.height * 0.25,
      flexibleSpace: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        child: CustomCachedImage(
          imageUrl: imageUrl,
          height: context.height * 0.25,
        ),
      ),
    );
  }
}
