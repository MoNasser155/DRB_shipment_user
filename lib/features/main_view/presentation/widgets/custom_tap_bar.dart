import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spaceing_helper.dart';
import '../cubits/cubit/main_view_cubit.dart';
import 'tap/tap_item.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainViewCubit, MainViewState>(
      builder: (context, state) {
        final cubit = MainViewCubit.get(context);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: SpacingHelper.horizontal12),
          child: Container(
            height: 56.h,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                cubit.tabs.length,
                (index) => Expanded(
                  child: TabItem(
                
                    index: index,
                    config: cubit.tabs[index],
                    isSelected: cubit.isTabSelected(index),
                    onTap: () => cubit.onTabPressed(index),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
