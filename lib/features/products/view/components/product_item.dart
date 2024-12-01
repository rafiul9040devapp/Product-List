import 'package:flutter/material.dart';
import 'package:product_list/core/utils/ui_helper.dart';
import 'package:product_list/features/products/view/helper/product_helper.dart';
import 'package:product_list/routes/navigation_helper.dart';
import 'package:product_list/routes/routes_name.dart';
import 'package:product_list/widgets/custom_circular_image_view.dart';
import '../../model/product.dart';


class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(product.id.toString()),
      background: Container(
        color: Colors.yellowAccent.shade700,
        alignment: Alignment.centerLeft,
        padding: UIHelper.horizontalMarginLarge,
        child: const Icon(Icons.edit, color: Colors.white),
      ),
      secondaryBackground: Container(
        color: Colors.red.shade300,
        alignment: Alignment.centerRight,
        padding: UIHelper.horizontalMarginLarge,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          return await ProductHelper.showDeleteConfirmationDialogue(context, product);
        } else if (direction == DismissDirection.startToEnd) {
          _navigateToUpdateScreen(context, product);
          return false;
        }
        return false;
      },
      child: GestureDetector(
        onTap: () {
          _navigateToDetailsScreen(context);
        },
        child: ListTile(
          leading: CustomCircularImageView(imageUrl: product.imageUrl ?? '',
              isHero: true,
              heroTag: product.id ?? ''),
          title: Text(product.productName ?? ''),
          subtitle: Text('\$${product.unitPrice?.toStringAsFixed(2)}'),
        ),
      ),
    );
  }

  void _navigateToUpdateScreen(BuildContext context, Product product) {
    context.navigateTo(
        routeName: RoutesName.createOrUpdateProduct, arguments: product);
  }

  void _navigateToDetailsScreen(BuildContext context) {
    context.navigateTo(
        routeName: RoutesName.productDetails, arguments: product);
  }
}
