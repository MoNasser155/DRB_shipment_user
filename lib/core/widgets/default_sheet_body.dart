import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../color_helper.dart';

class DefaultSheetBody extends StatelessWidget {
  final Widget child;
  final Color? color;
  const DefaultSheetBody({super.key, required this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 1.sw,
              padding: EdgeInsets.only(
                bottom:
                    ScreenUtil().bottomBarHeight == 0
                        ? 20.h
                        : ScreenUtil().bottomBarHeight,
                left: 20.w,
                right: 20.w,
                top: 15.h,
              ),
              decoration: BoxDecoration(
                color: color ?? ColorHelper.backgroundBlack,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Wrap(children: [Gap(15.h), child]),
            ),
          ],
        ),
      ),
    );
  }
}
