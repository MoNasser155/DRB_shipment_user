import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/enums/state_status.dart';
import '../../../../core/helpers/redius_helper.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/widgets/custom_image_carusel.dart';
import '../../data/models/ads_banner_model.dart';
import '../cubits/cubit/home_cubit.dart';

class CustomAdsPanner extends StatelessWidget {
  const CustomAdsPanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final ads =
            state.status == StateStatus.loading
                ? <AdsBannerModel>[]
                : state.adsList;
        return SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: SpacingHelper.kHorizontalPadding,
          ),
          sliver: SliverToBoxAdapter(
            child: Skeletonizer(
              enabled: state.status == StateStatus.loading,
              child: CustomAdsCarouselViewer(
                images: ads.map((e) => e.imageUrl ?? '').toList(),
                title: ads.map((e) => e.title ?? '').toList(),
                subtitle: ads.map((e) => e.subTitle ?? '').toList(),
                autoPlay: true,
                borderRadius: BorderRadius.circular(RadiusHelper.kRadius16),
              ),
            ),
          ),
        );
      },
    );
  }
}
