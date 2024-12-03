import 'package:flutter/material.dart';
import 'package:product_list/di/injection_container.dart';
import 'package:product_list/notification/notification_service.dart';
import 'package:product_list/product_app.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initialize();
  await InjectionContainer.initializeDependencies();
  runApp(const ProductApp());
}

//flutter pub run intl_utils:generate

