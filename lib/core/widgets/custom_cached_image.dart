import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../color_helper.dart';
import '../helpers/redius_helper.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({super.key, this.radius, this.width, this.height});
  final double? radius, width, height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? RadiusHelper.kRadius4),
      child: CachedNetworkImage(
        imageUrl:
            "https://i.pinimg.com/736x/d3/e7/0d/d3e70d89e5bfbe3b18c4ccdb6901d7df.jpg",
        width: width ?? 40,
        height: height ?? 40,
        fit: BoxFit.cover,
        placeholder:
            (context, url) => CircularProgressIndicator(
              color: ColorHelper.primaryGreen,
              constraints: const BoxConstraints(maxHeight: 24, maxWidth: 24),
            ),
        errorWidget:
            (context, url, error) =>
                Icon(Icons.error, color: Colors.red, size: 24),
      ),
    );
  }
}
