import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:product_list/core/constants/api_constants.dart';
import 'package:product_list/core/network_resource/api_client.dart';
import 'package:product_list/core/network_resource/custom_interceptor.dart';
import 'package:product_list/data/network/api_service.dart';
import 'package:product_list/data/network/api_service_impl.dart';
import 'package:product_list/features/bottom_nav/bloc/navigation_bloc.dart';
import 'package:product_list/features/connectivity/cubit/connectivity_cubit.dart';
import 'package:product_list/features/products/bloc/product_bloc.dart';
import 'package:product_list/repository/product/product_repository.dart';
import 'package:product_list/repository/product/product_repository_impl.dart';

final sl = GetIt.instance;

class InjectionContainer {
  static Future<void> initializeDependencies() async {
    _registerClients();
    _registerApiService();
    _registerRepositories();
    _registerBlocs();
    await sl.allReady();
  }

  static void _registerClients() {
    sl.registerLazySingleton<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: ApiConstants.BASE_URL,
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 10),
          sendTimeout: const Duration(seconds: 10),
        ),
      ),
    );

    sl.registerLazySingleton<Connectivity>(() => Connectivity());
    sl.registerLazySingleton<CustomInterceptor>(() => CustomInterceptor(dio:sl<Dio>()));
    sl.registerLazySingleton<ApiClient>(() => ApiClient(dio: sl<Dio>()));
  }

  static void _registerApiService() {
    sl.registerLazySingleton<ApiService>(() => ApiServiceImpl(apiClient: sl<ApiClient>()));
  }

  static void _registerRepositories() {
    sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(apiService: sl<ApiService>()));
  }

  static void _registerBlocs() {
    sl.registerFactory<ConnectivityCubit>(() => ConnectivityCubit(connectivity: sl<Connectivity>()));
    sl.registerFactory<ProductBloc>(() => ProductBloc(productRepository: sl<ProductRepository>()));
    sl.registerFactory<NavigationBloc>(() => NavigationBloc());
  }
}
