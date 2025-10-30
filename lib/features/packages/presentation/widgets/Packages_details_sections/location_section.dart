import 'package:drb_shipment_user/core/extensions/buildcontext_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../cubits/package_details/package_details_cubit.dart';

class PackageDetailsLocationSection extends StatelessWidget {
  const PackageDetailsLocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.4,
      child: BlocBuilder<PackageDetailsCubit, PackageDetailsState>(
        builder: (context, state) {
          final cubit = PackageDetailsCubit.get(context);
          return ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            child: GoogleMap(
              zoomGesturesEnabled: false,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              mapToolbarEnabled: false,
              initialCameraPosition:
                  state.cameraPosition ??
                  const CameraPosition(target: LatLng(0, 0), zoom: 10),
              markers: state.markers,
              polylines: state.polylines,
              onMapCreated: (controller) {
                cubit.setMapController(controller);
              },
            ),
          );
        },
      ),
    );
  }
}
