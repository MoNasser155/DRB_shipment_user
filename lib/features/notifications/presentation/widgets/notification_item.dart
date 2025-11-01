// updated_notification_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/color_helper.dart';
import '../../../../core/helpers/spaceing_helper.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, this.color, this.onTap});

  final Color? color;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            color: color ?? Colors.transparent,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: SpacingHelper.kVertical12,
              ),
              child: Column(
                spacing: 8.h,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Customer Name orders product name',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorHelper.primaryGreen,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '2023-01-01',
                            style: TextStyle(
                              color: ColorHelper.grey500,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: ColorHelper.grey600,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
