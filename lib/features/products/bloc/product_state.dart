part of 'product_bloc.dart';

enum ProductStatus { initial, loading, success, error }

class ProductState extends Equatable {
  final ProductStatus status;
  final Product product;
  final List<Product> productList;
  final String errorMessage;
  final String successMessage;

  const ProductState({
    this.status = ProductStatus.initial,
    this.product = const Product(
        id: '',
        productName: '',
        imageUrl: '',
        quantity: 0,
        unitPrice: 0,
        totalPrice: 0,
        productCode: 0),
    this.productList = const <Product>[],
    this.errorMessage = '',
    this.successMessage = '',
  });

  ProductState copyWith({
    ProductStatus? status,
    Product? product,
    List<Product>? productList,
    String? errorMessage,
    String? successMessage,
  }) {
    return ProductState(
      status: status ?? this.status,
      product: product ?? this.product,
      productList: productList ?? this.productList,
      errorMessage: errorMessage ?? this.errorMessage,
      successMessage: successMessage ?? this.successMessage,
    );
  }

  @override
  List<Object?> get props =>
      [status, product, productList, errorMessage, successMessage];
}
