import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_list/core/utils/theme_helper.dart';
import 'package:product_list/features/products/model/product.dart';

import '../../../../core/utils/ui_helper.dart';
import '../../../../generated/l10n.dart';
import '../../../../themes/app_colors.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/regular_image_view.dart';

class ProductDetailsInfo extends StatelessWidget {
  final Product product;
  const ProductDetailsInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: product.productName ?? S.current.not_available,
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: RegularImageView(
              imageUrl: product.imageUrl ?? S.current.not_available,
              isHero: true,
              heroTag: product.id ?? S.current.not_available,
              fit: BoxFit.cover,
            ),
          ),
          // Product details card
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: UIHelper.screenWidth * .7,
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(.9),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25.r),topRight:  Radius.circular(25.r)),
              ),
              child: Padding(
                padding: UIHelper.paddingMedium,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    // Product Name
                    Text(
                      product.productName ?? S.current.no_name,
                      style: context.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    UIHelper.verticalSpaceMedium(),

                    // Product Code
                    _buildDetailRow(
                      context,
                      label: S.current.products_code,
                      value: product.productCode?.toString() ?? S.current.not_available,
                    ),
                    UIHelper.verticalSpaceSmall(),

                    // Quantity
                    _buildDetailRow(
                      context,
                      label: S.current.quantity,
                      value: product.quantity?.toString() ?? S.current.not_available,
                    ),
                    UIHelper.verticalSpaceSmall(),

                    // Unit Price
                    _buildDetailRow(
                      context,
                      label: S.current.unit_price,
                      value: product.unitPrice != null
                          ? '\$${product.unitPrice}'
                          : S.current.not_available,
                    ),
                    UIHelper.verticalSpaceSmall(),

                    // Total Price
                    _buildDetailRow(
                      context,
                      label: S.current.total_price,
                      value: product.totalPrice != null
                          ? '\$${product.totalPrice}'
                          : S.current.not_available,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, {required String label, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style:context.textTheme.bodyLarge,
        ),
        Text(
          value,
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
