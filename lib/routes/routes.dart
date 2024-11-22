import 'package:flutter/material.dart';
import 'package:product_list/features/products/model/product.dart';
import 'package:product_list/routes/routes_name.dart';
import 'package:product_list/widgets/error_message_display.dart';
import '../features/pages.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.internetConnectionCheck:
        return MaterialPageRoute(
          builder: (context) =>   const InternetConnectionCheckPage(),
        );
      case RoutesName.product:
        return MaterialPageRoute(
          builder: (context) => const ProductPage(),
        );
      case RoutesName.productDetails:
        final args = settings.arguments as Product;
        return MaterialPageRoute(
          builder: (context) => ProductDetailsPage(product: args),
        );
      case RoutesName.createOrUpdateProduct:
        final args = settings.arguments as Product?;
        return MaterialPageRoute(
          builder: (context) => CreateOrUpdateProductPage(product:args),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => const ErrorMessageDisplay(message: 'Page not found'),
    );
  }
}
