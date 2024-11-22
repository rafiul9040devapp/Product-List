import 'package:flutter/material.dart';
import 'package:product_list/features/products/model/product.dart';
import 'package:product_list/features/products/view/components/product_item.dart';
import 'package:product_list/routes/navigation_helper.dart';
import 'package:product_list/routes/routes_name.dart';

import '../../../../widgets/custom_app_bar.dart';

class ProductList extends StatelessWidget {
  final List<Product> productList;

  const ProductList({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Products',hasBackButton: false),
        body: ListView.builder(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            final product = productList[index];
            return ProductItem(product: product);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.navigateTo(routeName: RoutesName.createOrUpdateProduct);
          },
          tooltip: 'Add Product',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
