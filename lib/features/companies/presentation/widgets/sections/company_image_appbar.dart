
import 'package:drb_shipment_user/core/extensions/buildcontext_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/color_helper.dart';
import '../../../../../core/widgets/custom_cached_image.dart';
import '../../cubits/company_details/company_details_cubit.dart';

class CompanyImageAppbar extends StatelessWidget {
  const CompanyImageAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyDetailsCubit, CompanyDetailsState>(
      buildWhen: (previous, current) {
        return previous.companyModel != current.companyModel;
      },
      builder: (context, state) {
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
              imageUrl: state.companyModel.imageUrl,
              height: context.height * 0.25,
            ),
          ),
        );
      },
    );
  }
}