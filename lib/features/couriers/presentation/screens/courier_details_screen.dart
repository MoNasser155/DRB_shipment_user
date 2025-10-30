import 'package:drb_shipment_user/features/couriers/data/models/courier_model.dart';
import 'package:flutter/material.dart';

import '../widgets/courier_details_body.dart';

class CourierDetailsScreen extends StatelessWidget {
  const CourierDetailsScreen({super.key, required this.couriersModel});
  final CourierModel couriersModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body : CourierDetailsBody(couriersModel:couriersModel),
    );
  }
}
