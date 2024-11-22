import 'package:dartz/dartz.dart';
import 'package:product_list/core/constants/api_constants.dart';
import 'package:product_list/core/constants/app_constants.dart';
import 'package:product_list/core/network_resource/api_client.dart';
import 'package:product_list/core/network_resource/api_exceptions.dart';
import 'package:product_list/data/network/api_service.dart';
import 'package:product_list/features/products/model/product.dart';

import '../../core/utils/helper.dart';

class ApiServiceImpl extends ApiService {
  final ApiClient apiClient;

  ApiServiceImpl({required this.apiClient});

  @override
  Future<Either<ApiException, List<Product>>> getAllProducts() async {
    try {
      final apiResponse = await apiClient.request(
        endPoints: ApiConstants.READ_PORDUCT_END_POINT,
        method: Method.GET,
      );
      return apiResponse.fold(
        (failure) {
          return Left(ApiException(failure.message));
        },
        (success) {
          final Map<String, dynamic> responseData = success.data;

          if (responseData[AppConstants.status] == AppConstants.success) {
            final successResponse = responseData[AppConstants.data];
            if (successResponse is List && successResponse.isNotEmpty) {
              final List<Product> productList = successResponse
                  .map((product) => Product.fromJson(product))
                  .toList();
              return Right(productList);
            } else {
              return Left(ApiException('Empty Product List'));
            }
          } else {
            return Left(ApiException(
                'Unexpected response status: ${responseData[AppConstants.status]}'));
          }
        },
      );
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, Product>> getProductDetails(
      String productID) async {
    try {
      final apiResponse = await apiClient.request(
        endPoints: '${ApiConstants.READ_PORDUCT_BY_ID_END_POINT}$productID',
        method: Method.GET,
      );

      return apiResponse.fold(
        (failure) {
          return Left(ApiException(failure.message));
        },
        (success) {
          final Map<String, dynamic> responseData = success.data;
          if (responseData[AppConstants.status] == AppConstants.success) {
            final successResponse = responseData[AppConstants.data];
            if (successResponse is List && successResponse.isNotEmpty) {
              final List<Product> productList = successResponse
                  .map((product) => Product.fromJson(product))
                  .toList();
              return Right(productList[0]);
            } else {
              return Left(ApiException('No Product Found'));
            }
          } else {
            return Left(ApiException(
                'Unexpected response status: ${responseData[AppConstants.status]}'));
          }
        },
      );
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, String>> deleteProduct(String productID) async {
    try {
      final apiResponse = await apiClient.request(
        endPoints: '${ApiConstants.DELETE_PORDUCT_END_POINT}$productID',
        method: Method.GET,
      );

      return apiResponse.fold(
        (failure) {
          return Left(ApiException(failure.message));
        },
        (success) {
          final Map<String, dynamic> responseData = success.data;
          if (responseData[AppConstants.status] == AppConstants.success) {
            final data = responseData[AppConstants.data];

            if (data != null && data[AppConstants.acknowledged] == true) {
              return const Right('Product Removed Successfully');
            } else {
              return Left(
                  ApiException('Failed to delete product: No acknowledgment'));
            }
          } else {
            return Left(ApiException(
                'Unexpected response status: ${responseData[AppConstants.status]}'));
          }
        },
      );
    } catch (e) {
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
      Map<String, dynamic> formData = {
        "ProductName": productName,
        "ProductCode": generateProductCode(),
        "Img": getRandomPlaceholderUrl(),
        "Qty": productQuantity,
        "UnitPrice": productUnitPrice,
        "TotalPrice": calculateTotalPrice(
            quantity: productQuantity, unitPrice: productUnitPrice),
      };

      final apiResponse = await apiClient.request(
        endPoints: ApiConstants.CREATE_PORDUCT_END_POINT,
        method: Method.POST,
        data: formData,
      );

      return apiResponse.fold(
        (failure) => Left(ApiException(failure.message)),
        (success) {
          final Map<String, dynamic> responseData = success.data;
          if (responseData[AppConstants.status] == AppConstants.success) {
            final data = responseData[AppConstants.data];
            Product createdProduct = Product.fromJson(data);
            print(createdProduct);
            return const Right('Product created successfully');
          } else if(responseData[AppConstants.status] == AppConstants.fail){
            return Left(ApiException('Product Code Already Exists. Try Again.'));
          }else {
            return Left(ApiException(
                'Unexpected response status: ${responseData[AppConstants.status]}'));
          }
        },
      );
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, String>> updateProduct({required Product product}) async {
    try {
      Map<String, dynamic> formData = {
        "ProductName": product.productName,
        "ProductCode": product.productCode,
        "Img": product.imageUrl,
        "Qty": product.quantity,
        "UnitPrice": product.unitPrice,
        "TotalPrice": product.totalPrice,
      };

      final apiResponse = await apiClient.request(
        endPoints: '${ApiConstants.UPDATE_PORDUCT_END_POINT}${product.id}',
        method: Method.POST,
        data: formData,
      );

      return apiResponse.fold(
            (failure) => Left(ApiException(failure.message)),
            (success) {
          final Map<String, dynamic> responseData = success.data;
          if (responseData[AppConstants.status] == AppConstants.success) {
            final data = responseData[AppConstants.data];
            Product createdProduct = Product.fromJson(data);
            print(createdProduct);
            return const Right('Product Updated successfully');
          } else if(responseData[AppConstants.status] == AppConstants.fail){
            return Left(ApiException('Unable To Update Product'));
          }else {
            return Left(ApiException(
                'Unexpected response status: ${responseData[AppConstants.status]}'));
          }
        },
      );
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }
}
