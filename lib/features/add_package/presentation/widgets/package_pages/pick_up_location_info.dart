import 'package:drb_shipment_user/core/widgets/expanded_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../core/helpers/redius_helper.dart';
import '../../../../../core/languages/languages.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../../core/themes/text_theme.dart';
import '../../../data/models/governments_model.dart';
import '../../cubits/cubit/add_package_cubit.dart';
import '../custom_package_column.dart';

class PickUpLocationInfo extends StatelessWidget {
  const PickUpLocationInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPackageCubit, AddPackageState>(
      buildWhen:
          (previous, current) =>
              previous.status != current.status ||
              previous.pickupLocation != current.pickupLocation ||
              previous.pickUpGovernorate != current.pickUpGovernorate,

      builder: (context, state) {
        final cubit = AddPackageCubit.get(context);
        return CustomPackageColumn(
          children: [
            Gap(0),
            Center(
              child: Text(
                LocaleKeys.pickupLocation,
                style: AppTextTheme.text18W600grey100,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(RadiusHelper.kRadius8),
              child: AspectRatio(
                aspectRatio: 1.7,
                child: GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(30.04652587682479, 31.226533111935872),
                    zoom: 10,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId('pickup'),
                      infoWindow: InfoWindow(title: LocaleKeys.pickupLocation),
                      position: LatLng(
                        state.pickupLocation?.latitude ?? 0.0,
                        state.pickupLocation?.longitude ?? 0.0,
                      ),
                    ),
                  },
                  onTap: (coords) {
                    cubit.setPickupLocation(coords);
                  },
                  onMapCreated: (controller) {
                    cubit.setPickupController(controller);
                  },
                ),
              ),
            ),
            Gap(0),
            ExpandedDropdown(
              hint: LocaleKeys.government,
              items: state.governmentsModel.data,
              itemLabelBuilder:
                  (item) =>
                      Languages.currentLanguage.isArabic
                          ? item.governmentAr
                          : item.governmentEn,
              onChanged: (value) {
                cubit.setPickUpGov(value ?? GovernmentsData.initial());
              },
            ),
            Gap(0),

            ExpandedDropdown(
              hint:
                  state.pickUpGovernorate.governmentEn == ''
                      ? LocaleKeys.pleaseSelectGovernmentFirst
                      : LocaleKeys.city,
              items: state.pickUpGovernorate.cities,
              itemLabelBuilder:
                  (item) =>
                      Languages.currentLanguage.isArabic
                          ? item.cityAr
                          : item.cityEn,
              onChanged: (value) {
                cubit.setPickUpCity(value ?? Cities.initial());
              },
            ),
          ],
        );
      },
    );
  }
}
