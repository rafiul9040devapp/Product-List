import 'package:dartz/dartz.dart';
import 'package:product_list/core/network_resource/api_exceptions.dart';
import 'package:product_list/data/network/api_service.dart';
import 'package:product_list/features/products/model/product.dart';
import 'package:product_list/repository/product/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ApiService apiService;

  ProductRepositoryImpl({required this.apiService});

  @override
  Future<Either<ApiException, List<Product>>> getAllProducts() async {
    try {
      return await apiService.getAllProducts();
    } catch (e) {
      print('Error in ProductRepositoryImpl: ${e.toString()}');
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, Product>> getProductDetails(
      String productID) async {
    try {
      return await apiService.getProductDetails(productID);
    } catch (e) {
      print('Error in ProductRepositoryImpl: ${e.toString()}');
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, String>> deleteProduct(String productID) async {
    try {
      return await apiService.deleteProduct(productID);
    } catch (e) {
      print('Error in ProductRepositoryImpl: ${e.toString()}');
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, String>> createProduct({
    required String productName,
    required int productQuantity,
    required int productUnitPrice,
  }) async {
    try {
      return await apiService.createProduct(
        productName: productName,
        productQuantity: productQuantity,
        productUnitPrice: productUnitPrice,
      );
    } catch (e) {
      print('Error in ProductRepositoryImpl: ${e.toString()}');
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, String>> updateProduct({required Product product}) async {
    try {
      return await apiService.updateProduct(product: product);
    } catch (e) {
      print('Error in ProductRepositoryImpl: ${e.toString()}');
      return Left(ApiException(e.toString()));
    }
  }
}
