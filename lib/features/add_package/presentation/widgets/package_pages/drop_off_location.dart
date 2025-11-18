import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../core/helpers/redius_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../../core/themes/text_theme.dart';
import '../../cubits/cubit/add_package_cubit.dart';
import '../custom_package_column.dart';

class DropOffLocationInfo extends StatelessWidget {
  const DropOffLocationInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPackageCubit, AddPackageState>(
      buildWhen:
          (previous, current) =>
              previous.status != current.status ||
              previous.dropoffLocation != current.dropoffLocation,
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
                      markerId: MarkerId('dropoff'),
                      infoWindow: InfoWindow(title: LocaleKeys.dropoffLocation),
                      position: LatLng(
                        state.dropoffLocation?.latitude ?? 0.0,
                        state.dropoffLocation?.longitude ?? 0.0,
                      ),
                    ),
                  },
                  onTap: (coords) {
                    cubit.setDropoffLocation(coords);
                  },
                  onMapCreated: (controller) {
                    cubit.setDropoffController(controller);
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
