import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../cubits/cubit/add_package_cubit.dart';
import 'add_package_navigation_bottom.dart';

class AddNewPackageBody extends StatelessWidget {
  const AddNewPackageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<AddPackageCubit, AddPackageState>(
            buildWhen: (previous, current) => previous.user != current.user,
            builder: (context, state) {
              final cubit = AddPackageCubit.get(context);
              return PageView(
                controller: cubit.pageController,
                onPageChanged: cubit.onPageChanged,
                physics: const NeverScrollableScrollPhysics(),
                children: cubit.pages,
              );
            },
          ),
        ),
        AddPackageNavigationBottom(),
        Gap(kBottomNavigationBarHeight * 1.35),
      ],
    );
  }
}
