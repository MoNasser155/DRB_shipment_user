import 'package:flutter/material.dart';

import '../widgets/couriers_body.dart';

class CouriersScreen extends StatelessWidget {
  const CouriersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(),
      body:CouriersBody(),
    );
  }
}