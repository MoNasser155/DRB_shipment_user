import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../color_helper.dart';
import '../languages/local_keys.g.dart';
import 'default_sheet_body.dart';

class ChooseImageSourceSheet extends StatelessWidget {
  const ChooseImageSourceSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultSheetBody(
      child: Column(
        children: [
          Container(
            width: 80.w,
            height: 5.h,
            decoration: BoxDecoration(
              color: ColorHelper.primaryGreen,
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
          Gap(10.h),

          TextButton(
            style: TextButton.styleFrom(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            ),
            onPressed: () {
              //  cubit.pickImage();
            },
            child: Row(
              children: [
                Icon(Icons.image, color: ColorHelper.primaryGreen),
                Gap(8.w),
                Text(
                  LocaleKeys.pickImage,
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium!.copyWith(color: ColorHelper.primaryGreen),
                ),
              ],
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            ),
            onPressed: () {
              //  cubit.takeImage();
            },
            child: Row(
              children: [
                Icon(Icons.camera_alt, color: ColorHelper.primaryGreen),
                Gap(8.w),
                Text(
                  LocaleKeys.takePhoto,
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium!.copyWith(color: ColorHelper.primaryGreen),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
