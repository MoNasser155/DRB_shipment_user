import 'package:drb_shipment_user/core/extensions/buildcontext_extensions.dart';
import 'package:drb_shipment_user/features/packages/presentation/cubits/package_details/package_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PackageDetailsLocationSection extends StatelessWidget {
  const PackageDetailsLocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height / 4,
      width: double.infinity,
      child: BlocBuilder<PackageDetailsCubit, PackageDetailsState>(
        builder: (context, state) {
          return GoogleMap(
            zoomGesturesEnabled: false,
            initialCameraPosition: CameraPosition(
              target: LatLng(
                state.packagesModel.dropoffLocation.latitude,
                state.packagesModel.dropoffLocation.longitude,
              ),

              zoom: 15,
            ),
            markers: <Marker>{
              Marker(
                markerId: const MarkerId('dropoffLocation'),
                position: LatLng(
                  state.packagesModel.dropoffLocation.latitude,
                  state.packagesModel.dropoffLocation.longitude,
                ),
              ),
            },
            onMapCreated: (GoogleMapController controller) {},
          );
        },
      ),
    );
  }
}
