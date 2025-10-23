import 'package:drb_shipment_user/core/constants.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cubit/main_view_cubit.dart';
import '../widgets/main_view_body.dart';
import '../widgets/main_view_bottom_sheet.dart';

class MainViewScreen extends StatelessWidget {
  const MainViewScreen({super.key, this.index = 0});
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MainViewCubit>(),
      child: Scaffold(
        appBar: AppBar(),
        bottomSheet: MainViewBottomSheet(),
        body: MainViewBody(),
      ),
    );
  }
}
