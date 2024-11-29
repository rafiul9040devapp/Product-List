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
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => const HomePage(initialPage: 0),
        );
      case RoutesName.createProduct:
        return MaterialPageRoute(
          builder: (context) => const HomePage(initialPage: 1),
        );
      case RoutesName.product:
        return MaterialPageRoute(
          builder: (context) => const ProductPage(),
        );
      case RoutesName.createOrUpdateProduct:
        final args = settings.arguments as Product?;
        return MaterialPageRoute(
          builder: (context) => CreateOrUpdateProductPage(product:args),
        );
      case RoutesName.bottomNavigation:
        return MaterialPageRoute(
          builder: (context) => const BottomNavPage(),
        );
      case RoutesName.productDetails:
        final args = settings.arguments as Product;
        return MaterialPageRoute(
          builder: (context) => ProductDetailsPage(product: args),
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
