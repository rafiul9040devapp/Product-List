import 'package:dartz/dartz.dart';
import 'package:product_list/core/network_resource/api_exceptions.dart';
import 'package:product_list/features/products/model/product.dart';

abstract class ApiService{
  Future<Either<ApiException,List<Product>>> getAllProducts();
  Future<Either<ApiException,Product>> getProductDetails(String productID);

  Future<Either<ApiException,String>> deleteProduct(String productID);

  Future<Either<ApiException,String>> createProduct({required String productName, required int productQuantity, required int productUnitPrice});

  Future<Either<ApiException,String>> updateProduct({required Product product});
}