import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:product_list/core/utils/theme_helper.dart';
import 'package:product_list/core/utils/ui_helper.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/app_colors.dart';

class RegularImageView extends StatelessWidget {
  final String imageUrl;
  final double? width; // Optional for flexibility
  final double? height; // Optional for flexibility
  final bool isHero;
  final String heroTag;
  final BoxFit fit;

  const RegularImageView({
    super.key,
    required this.imageUrl,
    this.width, // Defaults will be calculated using ScreenUtil if not provided
    this.height,
    this.isHero = false,
    this.heroTag = '',
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    // Fallback to responsive defaults if width or height is not provided
    final double effectiveWidth = width ?? UIHelper.screenWidth;
    final double effectiveHeight = height ?? 250.h;

    final imageWidget = CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: effectiveWidth,
          height: effectiveHeight,
          color: Colors.grey,
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: effectiveWidth,
        height: effectiveHeight,
        color: context.colorTheme.secondary,
        child: Icon(
          Icons.broken_image,
          color: AppColors.red.withOpacity(0.5),
          size: 150.sp, // Responsive icon size
        ),
      ),
      imageBuilder: (context, imageProvider) => Image(
        image: imageProvider,
        width: effectiveWidth,
        height: effectiveHeight,
        fit: fit,
      ),
    );

    if (isHero) {
      return Hero(
        tag: heroTag,
        child: imageWidget,
      );
    }
    return imageWidget;
  }
}
