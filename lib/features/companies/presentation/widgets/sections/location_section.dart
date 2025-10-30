import 'package:drb_shipment_user/core/helpers/redius_helper.dart';
import 'package:drb_shipment_user/features/companies/presentation/cubits/company_details/company_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/helpers/spaceing_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../../core/themes/text_theme.dart';

class CompanyLocationSection extends StatelessWidget {
  const CompanyLocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SpacingHelper.kHorizontalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LocaleKeys.location, style: AppTextTheme.text18W600grey100),
            Gap(SpacingHelper.kVertical8),
            BlocBuilder<CompanyDetailsCubit, CompanyDetailsState>(
              buildWhen: (previous, current) {
                return previous.companyModel != current.companyModel;
              },
              builder: (context, state) {
                return AspectRatio(
                  aspectRatio: 1.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(RadiusHelper.kRadius12),
                    child: GoogleMap(
                      zoomControlsEnabled: false,
                      scrollGesturesEnabled: false,
                      rotateGesturesEnabled: false,
                      tiltGesturesEnabled: false,
                      zoomGesturesEnabled: false,
                      markers: {
                        Marker(
                          markerId: MarkerId('1'),
                          position: LatLng(
                            state.companyModel.location.latitude,
                            state.companyModel.location.longitude,
                          ),
                        ),
                      },
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                          state.companyModel.location.latitude,
                          state.companyModel.location.longitude,
                        ),
                        zoom: 15,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
