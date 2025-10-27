import 'package:flutter/material.dart';

import '../widgets/courier_details_body.dart';

class CourierDetailsScreen extends StatelessWidget {
  const CourierDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CourierDetailsBody(),
    );
  }
}