import 'package:flutter/material.dart';
import '../widgets/signup/signup_body.dart';
import '../widgets/signup/signup_bottom_sheet.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      bottomSheet: SignupBottomSheet(),
      body: SignupBody(),
    );
  }
}
