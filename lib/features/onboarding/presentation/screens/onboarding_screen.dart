import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: PageView(children: [])),
            ElevatedButton(onPressed: () {}, child: const Text('Next')),
          ],
        ),
      ),
    );
  }
}
