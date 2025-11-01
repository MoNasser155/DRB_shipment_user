

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/color_helper.dart';
import '../../../../core/widgets/choose_image_source_sheet.dart';

class UserAccountSliverAppbar extends StatelessWidget {
  const UserAccountSliverAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      snap: true,
      centerTitle: true,
      backgroundColor: ColorHelper.backgroundBlack,
      surfaceTintColor: ColorHelper.transparent,
      foregroundColor: ColorHelper.transparent,
      shadowColor: ColorHelper.transparent,
      toolbarHeight: 200.h,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: ColorHelper.primaryGreen,
        statusBarIconBrightness: Brightness.dark,
      ),
      automaticallyImplyLeading: false,
      flexibleSpace: ClipPath(
        clipper: CurvedAppBarClipper(),
        child: Container(
          decoration: BoxDecoration(
            color: ColorHelper.primaryGreen,
            boxShadow: [
              BoxShadow(
                color: ColorHelper.grey100.withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
        ),
      ),

      title: Column(
        children: [
          Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorHelper.white,
              boxShadow: [
                BoxShadow(
                  color: ColorHelper.grey100.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ChooseImageSourceSheet();
                  },
                );
              },
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://i.pinimg.com/736x/2b/2d/75/2b2d75795b102172ecf8d89e7e853dfc.jpg',
                      height: 120.w,
                      width: 120.w,
                      fit: BoxFit.fill,
                      errorWidget: (context, url, error) {
                        return const Icon(
                          Icons.person,
                          size: 88,
                          color: ColorHelper.grey400,
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ColorHelper.white,
                        boxShadow: [
                          BoxShadow(
                            color: ColorHelper.grey100.withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: ColorHelper.primaryGreen,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Gap(30.h),
        ],
      ),
    );
  }
}

/// 2. Curved Shape
class CurvedAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 40,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
