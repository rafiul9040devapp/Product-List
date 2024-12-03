part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchAllProductEvent extends ProductEvent {}

class ShowProductDetailsEvent extends ProductEvent {
  final String productID;

  ShowProductDetailsEvent({required this.productID});

  @override
  List<Object?> get props => [productID];
}

class RemoveProductEvent extends ProductEvent {
  final String productID;

  RemoveProductEvent({required this.productID});

  @override
  List<Object?> get props => [productID];
}

class AddNewProductEvent extends ProductEvent {
  final String productName;
  final int productQuantity;
  final int productUnitPrice;

  AddNewProductEvent({
    required this.productName,
    required this.productQuantity,
    required this.productUnitPrice,
  });

  @override
  List<Object?> get props => [productName, productQuantity, productUnitPrice];
}

class UpdatingExistingProductEvent extends ProductEvent{
  final Product product;

  UpdatingExistingProductEvent({required this.product});

  @override
  List<Object?> get props => [product];
}

class ResetProductStatusEvent extends ProductEvent{}
