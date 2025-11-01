import 'package:drb_shipment_user/core/widgets/textfield_withlabel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/color_helper.dart';
import '../../../../core/constants.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../../../core/utils/cashe_storage.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../auth/domain/entities/user_entity.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserEntity.fromMap(
      CacheStorage.read(Constants.userKey, isDecoded: true),
    );
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          automaticallyImplyLeading: false,
          surfaceTintColor: Colors.transparent,
          backgroundColor: ColorHelper.backgroundBlack,
          flexibleSpace: CustomAppbar(
            title: LocaleKeys.editProfile,
            applyPadding: true,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: SpacingHelper.kHorizontalPadding,
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              TextFieldWithLabel(
                label: LocaleKeys.email,
                hint: user.email,
                removeInit: false,
              ),
              Gap(SpacingHelper.kVertical8),
              TextFieldWithLabel(
                label: LocaleKeys.username,
                hint: user.usreName,
                removeInit: false,
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
