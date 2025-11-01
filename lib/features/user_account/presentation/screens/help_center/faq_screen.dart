import 'package:drb_shipment_user/core/widgets/custom_skeletonizer.dart';
import 'package:drb_shipment_user/features/user_account/data/models/faq_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../../core/color_helper.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/enums/state_status.dart';
import '../../../../../core/helpers/spaceing_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../../core/themes/text_theme.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../cubits/faq/faq_cubit.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<FaqCubit>()..getFaqs(),
      child: Scaffold(
        appBar: AppBar(),
        body: CustomScrollView(
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
                title: LocaleKeys.fAQ,
                applyPadding: true,
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: SpacingHelper.kHorizontalPadding,
              ),
              sliver: BlocBuilder<FaqCubit, FaqState>(
                buildWhen: (previous, current) => previous.faqs != current.faqs,
                builder: (context, state) {
                  final length =
                      state.status == StateStatus.loading
                          ? 20
                          : state.faqs.length;
                  return SliverList.separated(
                    itemBuilder: (context, index) {
                      final faq =
                          state.status == StateStatus.loading
                              ? FaqModel.skeleton()
                              : state.faqs[index];
                      return CustomSkeletonizer(
                        enabled: state.status == StateStatus.loading,
                        child: FaqItem(faq: faq),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Gap(SpacingHelper.kVertical8);
                    },
                    itemCount: length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FaqItem extends StatelessWidget {
  const FaqItem({super.key, required this.faq});
  final FaqModel faq;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      collapsedShape: RoundedRectangleBorder(
        side: BorderSide(color: ColorHelper.secondryOrange),
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: ColorHelper.grey100.withValues(alpha: 0.05),
      collapsedIconColor: ColorHelper.secondryOrange,
      iconColor: ColorHelper.primaryGreen,
      expandedAlignment: Alignment.centerLeft,
      tilePadding: EdgeInsets.symmetric(
        horizontal: SpacingHelper.horizontal8,
        vertical: SpacingHelper.kVertical4,
      ),
      visualDensity: VisualDensity(
        vertical: VisualDensity.minimumDensity,
        horizontal: VisualDensity.minimumDensity,
      ),
      childrenPadding: EdgeInsets.only(
        left: SpacingHelper.horizontal12,
        right: SpacingHelper.horizontal12,
        top: SpacingHelper.kVertical8,
      ),

      title: Text(faq.question, style: AppTextTheme.text18W600grey100),
      children: [
        Divider(
          color: ColorHelper.primaryGreen,
          thickness: 1,
          endIndent: SpacingHelper.horizontal20,
          indent: SpacingHelper.horizontal20,
          height: 0,
        ),
        Gap(SpacingHelper.kVertical12),
        Text(faq.answer, style: AppTextTheme.text18W600grey100),
        Gap(SpacingHelper.kVertical12),
      ],
    );
  }
}
