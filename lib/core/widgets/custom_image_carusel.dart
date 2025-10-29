import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:drb_shipment_user/core/color_helper.dart';
import 'package:drb_shipment_user/core/helpers/spaceing_helper.dart';
import 'package:drb_shipment_user/core/languages/languages.dart';
import 'package:drb_shipment_user/core/languages/local_keys.g.dart';
import 'package:drb_shipment_user/core/widgets/custom_dot_indicator.dart';
import 'package:drb_shipment_user/core/widgets/cutsom_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../helpers/redius_helper.dart';
import '../themes/text_theme.dart';

class CustomAdsCarouselViewer extends StatefulWidget {
  const CustomAdsCarouselViewer({
    super.key,
    required this.images,
    this.height,
    this.width,
    this.borderRadius,
    this.autoPlay = true,
    this.autoPlayInterval = const Duration(seconds: 3),
    this.showIndicator = true,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    required this.title,
    required this.subtitle,
  });

  final List<String> images;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final bool autoPlay;
  final Duration autoPlayInterval;
  final bool showIndicator;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final List<String> title, subtitle;

  @override
  State<CustomAdsCarouselViewer> createState() =>
      _CustomAdsCarouselViewerState();
}

class _CustomAdsCarouselViewerState extends State<CustomAdsCarouselViewer> {
  late PageController _pageController;
  int _currentIndex = 0;
  Timer? _autoPlayTimer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    if (widget.autoPlay && widget.images.isNotEmpty) {
      _startAutoPlay();
    }
  }

  @override
  void dispose() {
    _autoPlayTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    _autoPlayTimer = Timer.periodic(widget.autoPlayInterval, (timer) {
      if (widget.images.isEmpty) return;

      final nextIndex = (_currentIndex + 1) % widget.images.length;
      _pageController.animateToPage(
        nextIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  void _stopAutoPlay() {
    _autoPlayTimer?.cancel();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty) {
      return Container(
        height: widget.height ?? 200,
        width: widget.width ?? double.infinity,
        decoration: BoxDecoration(
          color: ColorHelper.grey100.withValues(alpha: 0.05),
          borderRadius: widget.borderRadius,
        ),
        child: const Center(
          child: Icon(Icons.image_not_supported, color: Colors.grey, size: 50),
        ),
      );
    }

    return Column(
      children: [
        GestureDetector(
          onPanStart: (_) => _stopAutoPlay(),
          onPanEnd: (_) {
            if (widget.autoPlay) {
              _startAutoPlay();
            }
          },
          child: ClipRRect(
            borderRadius: widget.borderRadius ?? BorderRadius.zero,
            child: SizedBox(
              height: widget.height ?? 200,
              width: widget.width ?? double.infinity,
              child: PageView.builder(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: widget.images.length,
                itemBuilder: (context, index) {
                  return CustomCaruselContent(widget: widget, index: index);
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        CustomDotIndicator(
          currentIndex: _currentIndex,
          count: widget.images.length,
        ),
      ],
    );
  }
}

class CustomCaruselContent extends StatelessWidget {
  const CustomCaruselContent({
    super.key,
    required this.widget,
    required this.index,
  });

  final CustomAdsCarouselViewer widget;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius ?? BorderRadius.zero,
        color: ColorHelper.primaryGreen,
      ),
      child: Stack(
        children: [
          Positioned(
            right: Languages.currentLanguage.isEnglish ? 0 : null,
            left: Languages.currentLanguage.isArabic ? 0 : null,
            bottom: 0,
            top: 0,
            child: ClipRRect(
              borderRadius:
                  Languages.currentLanguage.isArabic
                      ? BorderRadius.only(
                        topLeft: Radius.circular(RadiusHelper.kRadius16),
                        bottomLeft: Radius.circular(RadiusHelper.kRadius16),
                      )
                      : BorderRadius.only(
                        topRight: Radius.circular(RadiusHelper.kRadius16),
                        bottomRight: Radius.circular(RadiusHelper.kRadius16),
                      ),
              child: CachedNetworkImage(
                imageUrl: widget.images[index],
                fit: widget.fit,
                memCacheHeight: 200,
                memCacheWidth: 150,
                placeholder:
                    (context, url) =>
                        widget.placeholder ??
                        const Center(child: CircularProgressIndicator()),
                errorWidget:
                    (context, url, error) =>
                        widget.errorWidget ??
                        const Center(
                          child: Icon(Icons.error, color: Colors.red, size: 50),
                        ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SpacingHelper.horizontal12,
              vertical: SpacingHelper.kVertical12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title[index], style: AppTextTheme.text28W700White),
                Gap(SpacingHelper.kVertical8),
                Text(
                  widget.subtitle[index],
                  style: AppTextTheme.text20W600grey100,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        buttonChild: Text(
                          LocaleKeys.getDiscount,
                          style: AppTextTheme.buttonTextStyle,
                        ),
                        backgroundColor: ColorHelper.grey900,
                        onTap: () {},
                      ),
                    ),
                    Expanded(child: SizedBox()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
