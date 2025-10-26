import 'package:flutter/material.dart';

import '../widgets/packages_details_body.dart';

class PackagesDetailsScreen extends StatelessWidget {
  const PackagesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PackagesDetailsBody(),
    );
  }
}