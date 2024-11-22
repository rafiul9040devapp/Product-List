import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/features/products/bloc/product_bloc.dart';
import 'package:product_list/features/products/view/components/product_list.dart';
import 'package:product_list/widgets/error_message_display.dart';
import 'package:product_list/widgets/initial_state_display.dart';
import 'package:product_list/widgets/loading_state_display.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return switch (state.status) {
          ProductStatus.initial => const InitialStateDisplay(),
          ProductStatus.loading => const LoadingStateDisplay(),
          ProductStatus.success => state.productList.isNotEmpty
              ? ProductList(productList: state.productList)
              : SizedBox(),
          ProductStatus.error =>
            ErrorMessageDisplay(message: state.errorMessage),
        };
      },
    );
  }
}
