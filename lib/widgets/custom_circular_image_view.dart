import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_list/core/utils/theme_helper.dart';
import 'package:product_list/core/utils/ui_helper.dart';
import 'package:product_list/themes/app_colors.dart';
import '../themes/assets_path.dart';

class CustomCircularImageView extends StatelessWidget {
  final String imageUrl;
  final double? size;
  final String placeholderAsset;
  final String errorAsset;
  final bool isHero;
  final String heroTag;

  const CustomCircularImageView({
    super.key,
    required this.imageUrl,
    this.size,
    this.placeholderAsset = AppImages.placeHolder,
    this.errorAsset = AppImages.errorPlaceHolder,
    this.isHero = false,
    this.heroTag = '',
  });

  @override
  Widget build(BuildContext context) {
    final double effectiveSize = size ?? UIHelper.largeRadius;

    final imageWidget = CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => CircleAvatar(
        radius: effectiveSize / 2,
        backgroundImage: AssetImage(placeholderAsset),
      ),
      errorWidget: (context, url, error) => CircleAvatar(
        radius: effectiveSize / 2,
        backgroundColor: context.colorTheme.secondary,
        child: Icon(
          Icons.broken_image,
          color: AppColors.red.withOpacity(0.5),
          size: 40.0.sp, // Responsive icon size
        ),
      ),
      imageBuilder: (context, imageProvider) => Container(
        width: effectiveSize,
        height: effectiveSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
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
