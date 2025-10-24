import 'package:flutter/material.dart';

class HomeAdsHolder extends StatelessWidget {
  const HomeAdsHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: PageView.builder(
        
        itemBuilder:
            (context, index) => Container(
              width: double.infinity,
              height: 200,
              color: Colors.red,
            ),
        itemCount: 3,
      ),
    );
  }
}
