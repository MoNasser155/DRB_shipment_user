import 'package:drb_shipment_user/features/main_view/presentation/cubits/cubit/main_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainViewCubit, MainViewState>(
      builder: (context, state) {
        final cubit = MainViewCubit.get(context);
        return cubit.screens[state.selectedTabIndex];
      },
    );
  }
}
