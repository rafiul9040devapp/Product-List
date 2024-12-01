import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_list/core/utils/theme_helper.dart';
import 'package:product_list/core/utils/ui_helper.dart';
import 'package:product_list/features/products/bloc/product_bloc.dart';
import 'package:product_list/features/products/model/product.dart';
import 'package:product_list/routes/navigation_helper.dart';
import 'package:product_list/routes/routes_name.dart';
import 'package:product_list/themes/app_colors.dart';
import 'package:product_list/widgets/custom_app_bar.dart';
import 'package:product_list/widgets/error_message_display.dart';
import 'package:product_list/widgets/initial_state_display.dart';
import 'package:product_list/widgets/loading_state_display.dart';
import 'package:product_list/widgets/regular_image_view.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<ProductBloc>()
        .add(ShowProductDetailsEvent(productID: widget.product.id ?? ''));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return switch (state.status) {
          ProductStatus.initial => const InitialStateDisplay(),
          ProductStatus.loading => const LoadingStateDisplay(),
          ProductStatus.success => _buildUIAlternative(context, state.product),
          ProductStatus.error =>
            ErrorMessageDisplay(message: state.errorMessage),
        };
      },
    );
  }

  Widget _buildUI(BuildContext context, Product product) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: product.productName ?? 'N/A',
        ),
        body: SingleChildScrollView(
          padding: UIHelper.symmetricPadding(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Center(
                child: RegularImageView(
                  imageUrl: product.imageUrl ?? '',
                  isHero: true,
                  heroTag: product.id ?? '',
                  fit: BoxFit.cover,
                ),
              ),
              UIHelper.verticalSpaceLarge(),

              // Product Name
              Text(
                product.productName ?? 'Unnamed Product',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              UIHelper.verticalSpaceMedium(),

              // Product Price
              Row(
                children: [
                  Text(
                    'Price: ',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '\$${product.unitPrice?.toStringAsFixed(2) ?? 'N/A'}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              UIHelper.verticalSpaceMedium(),

              // Product Description
              Text(
                'Description:',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              UIHelper.verticalSpaceSmall(),
              Text(
                product.quantity.toString(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              UIHelper.verticalSpaceLarge(),


              // Action Buttons (Edit and Delete)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.navigateTo(routeName: RoutesName.createOrUpdateProduct,arguments: product);
                    },
                    child: const Text('Edit'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _deleteProduct(context, product.id);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text('Delete'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _deleteProduct(BuildContext context, String? productId) {
    if (productId == null) return;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Product'),
        content: const Text('Are you sure you want to delete this product?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              context.read<ProductBloc>().add(RemoveProductEvent(productID: productId));
              Navigator.pop(ctx); // Close the dialog
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  Widget _buildUIAlternative(BuildContext context, Product product) {
    return Scaffold(
      appBar: CustomAppBar(
        title: product.productName ?? 'N/A',
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: RegularImageView(
              imageUrl: product.imageUrl ?? '',
              isHero: true,
              heroTag: product.id ?? '',
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
                      product.productName ?? 'No Name',
                      style: context.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    UIHelper.verticalSpaceMedium(),

                    // Product Code
                    _buildDetailRow(
                      context,
                      label: 'Product Code',
                      value: product.productCode?.toString() ?? 'N/A',
                    ),
                    SizedBox(height: 8.h),

                    // Quantity
                    _buildDetailRow(
                      context,
                      label: 'Quantity',
                      value: product.quantity?.toString() ?? 'N/A',
                    ),
                    SizedBox(height: 8.h),

                    // Unit Price
                    _buildDetailRow(
                      context,
                      label: 'Unit Price',
                      value: product.unitPrice != null
                          ? '\$${product.unitPrice}'
                          : 'N/A',
                    ),
                    SizedBox(height: 8.h),

                    // Total Price
                    _buildDetailRow(
                      context,
                      label: 'Total Price',
                      value: product.totalPrice != null
                          ? '\$${product.totalPrice}'
                          : 'N/A',
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

// Helper function to build a row for product details
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
