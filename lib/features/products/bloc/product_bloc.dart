import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_list/repository/product/product_repository.dart';

import '../model/product.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc({required this.productRepository}) : super(const ProductState()) {
    on<FetchAllProductEvent>(_onFetchingProducts);
    on<ShowProductDetailsEvent>(_onShowingProductDetails);
    on<RemoveProductEvent>(_onRemovingProduct);
    on<AddNewProductEvent>(_onAddingNewProduct);
    on<UpdatingExistingProductEvent>(_onUpdatingProduct);
  }

  FutureOr<void> _onFetchingProducts(
      FetchAllProductEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(status: ProductStatus.loading));

    try {
      final response = await productRepository.getAllProducts();
      return response.fold(
        (failure) => emit(state.copyWith(
            status: ProductStatus.error, errorMessage: failure.message)),
        (success) => emit(state.copyWith(
            status: ProductStatus.success, productList: success)),
      );
    } catch (e) {
      emit(state.copyWith(
          status: ProductStatus.error, errorMessage: e.toString()));
    }
  }

  FutureOr<void> _onShowingProductDetails(
      ShowProductDetailsEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(status: ProductStatus.loading));

    try {
      final response =
          await productRepository.getProductDetails(event.productID);

      return response.fold(
        (failure) => emit(state.copyWith(
            status: ProductStatus.error, errorMessage: failure.message)),
        (success) => emit(
            state.copyWith(status: ProductStatus.success, product: success)),
      );
    } catch (e) {
      emit(state.copyWith(
          status: ProductStatus.error, errorMessage: e.toString()));
    }
  }

  FutureOr<void> _onRemovingProduct(
      RemoveProductEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(status: ProductStatus.loading));

    try {
      final response = await productRepository.deleteProduct(event.productID);

      return response.fold(
        (failure) => emit(state.copyWith(
            status: ProductStatus.error, errorMessage: failure.message)),
        (success) {
          emit(state.copyWith(
              status: ProductStatus.success, successMessage: success));
          add(FetchAllProductEvent());
        },
      );
    } catch (e) {
      emit(state.copyWith(
          status: ProductStatus.error, errorMessage: e.toString()));
    }
  }

  FutureOr<void> _onAddingNewProduct(
      AddNewProductEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(status: ProductStatus.loading));

    try {
      final response = await productRepository.createProduct(
        productName: event.productName,
        productUnitPrice: event.productUnitPrice,
        productQuantity: event.productQuantity,
      );

      return response.fold(
        (failure) => emit(state.copyWith(
            status: ProductStatus.error, errorMessage: failure.message)),
        (success) {
          emit(state.copyWith(
              status: ProductStatus.success, successMessage: success));
          add(FetchAllProductEvent());
        },
      );
    } catch (e) {
      emit(state.copyWith(
          status: ProductStatus.error, errorMessage: e.toString()));
    }
  }

  FutureOr<void> _onUpdatingProduct(
      UpdatingExistingProductEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(status: ProductStatus.loading));

    try {
      final response =
          await productRepository.updateProduct(product: event.product);

      return response.fold(
        (failure) => emit(state.copyWith(
            status: ProductStatus.error, errorMessage: failure.message)),
        (success) {
          emit(state.copyWith(
              status: ProductStatus.success, successMessage: success));
          add(FetchAllProductEvent());
        },
      );
    } catch (e) {
      emit(state.copyWith(
          status: ProductStatus.error, errorMessage: e.toString()));
    }
  }
}
