import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/helpers/spaceing_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../../core/widgets/textfield_withlabel.dart';
import '../custom_passfiled.dart';

class SignupInfoContainers extends StatelessWidget {
  const SignupInfoContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: SpacingHelper.kVertical8,
      children: [
        Row(
          children: [
            Expanded(
              child: TextFieldWithLabel(
                label: LocaleKeys.firstName,
                removeInit: true,
                hint: LocaleKeys.firstName,
              ),
            ),
            Gap(SpacingHelper.horizontal8),
            Expanded(
              child: TextFieldWithLabel(
                label: LocaleKeys.lastName,
                removeInit: true,
                hint: LocaleKeys.lastName,
              ),
            ),
          ],
        ),
        TextFieldWithLabel(
          label: LocaleKeys.email,
          removeInit: true,
          hint: 'username@example.com',
        ),
        TextFieldWithLabel(
          label: LocaleKeys.username,
          removeInit: true,
          hint:
              'username@example.com', //yellow with controller to generate a random name
        ),
        PassFieldWithLabel(
          label: LocaleKeys.password,
          removeInit: true,
          hint: '**********',
        ),
        PassFieldWithLabel(
          label: LocaleKeys.confirmPassword,
          removeInit: true,
          hint: '**********',
        ),
      ],
    );
  }
}
