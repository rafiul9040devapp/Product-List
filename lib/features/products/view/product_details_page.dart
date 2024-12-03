import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/features/products/bloc/product_bloc.dart';
import 'package:product_list/features/products/model/product.dart';
import 'package:product_list/widgets/error_message_display.dart';
import 'package:product_list/widgets/initial_state_display.dart';
import 'package:product_list/widgets/loading_state_display.dart';
import '../../../generated/l10n.dart';
import 'components/product_details_info.dart';


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
        .add(ShowProductDetailsEvent(productID: widget.product.id ?? S.current.not_available));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return switch (state.status) {
          ProductStatus.initial => const InitialStateDisplay(),
          ProductStatus.loading => const LoadingStateDisplay(),
          ProductStatus.success => ProductDetailsInfo(product: state.product),
          ProductStatus.error => ErrorMessageDisplay(message: state.errorMessage),
        };
      },
    );
  }
}
