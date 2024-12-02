import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:product_list/core/network_resource/api_exceptions.dart';
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
    on<ResetProductStatusEvent>(_onResettingProductList);
  }


  Future<void> _handleApiCall<T>({
    required Future<Either<ApiException, T>> apiCall,
    required Emitter<ProductState> emit,
    required void Function(T success) onSuccess,
  }) async {
    emit(state.copyWith(status: ProductStatus.loading));
    try {
      final response = await apiCall;
      response.fold(
            (failure) => emit(state.copyWith(
            status: ProductStatus.error, errorMessage: failure.message)),
            (success) => onSuccess(success),
      );
    } catch (e) {
      emit(state.copyWith(
          status: ProductStatus.error, errorMessage: e.toString()));
    }
  }

  FutureOr<void> _onFetchingProducts(
      FetchAllProductEvent event, Emitter<ProductState> emit) async {
    await _handleApiCall(
      apiCall: productRepository.getAllProducts(),
      emit: emit,
      onSuccess: (products) => emit(state.copyWith(
        status: ProductStatus.success,
        productList: products,
      )),
    );
  }

  FutureOr<void> _onShowingProductDetails(
      ShowProductDetailsEvent event, Emitter<ProductState> emit) async {
    await _handleApiCall(
      apiCall: productRepository.getProductDetails(event.productID),
      emit: emit,
      onSuccess: (productDetails) => emit(state.copyWith(
        status: ProductStatus.success,
        product: productDetails,
      )),
    );
  }

  FutureOr<void> _onRemovingProduct(
      RemoveProductEvent event, Emitter<ProductState> emit) async {
    await _handleApiCall(
      apiCall: productRepository.deleteProduct(event.productID),
      emit: emit,
      onSuccess: (successMessage) {
        final updatedList = state.productList
            .where((product) => product.id != event.productID)
            .toList();
        emit(state.copyWith(
          status: ProductStatus.success,
          productList: updatedList,
          successMessage: successMessage,
        ));
      },
    );
  }

  FutureOr<void> _onAddingNewProduct(
      AddNewProductEvent event, Emitter<ProductState> emit) async {
    await _handleApiCall(
      apiCall: productRepository.createProduct(
        productName: event.productName,
        productUnitPrice: event.productUnitPrice,
        productQuantity: event.productQuantity,
      ),
      emit: emit,
      onSuccess: (successMessage) {
        emit(state.copyWith(
          status: ProductStatus.success,
          successMessage: successMessage,
        ));
        add(FetchAllProductEvent());
      },
    );
  }

  FutureOr<void> _onUpdatingProduct(
      UpdatingExistingProductEvent event, Emitter<ProductState> emit) async {
    await _handleApiCall(
      apiCall: productRepository.updateProduct(product: event.product),
      emit: emit,
      onSuccess: (successMessage) {
        final updatedList = state.productList.map((product) {
          if (product.id == event.product.id) {
            return event.product;
          }
          return product;
        }).toList();
        emit(state.copyWith(
          status: ProductStatus.success,
          productList: updatedList,
          successMessage: successMessage,
        ));
      },
    );
  }

  FutureOr<void> _onResettingProductList(ResetProductStatusEvent event, Emitter<ProductState> emit) {
    emit(state.copyWith(status: ProductStatus.initial));
  }
}
