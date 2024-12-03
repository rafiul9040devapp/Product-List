// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `CRUD`
  String get app_name {
    return Intl.message(
      'CRUD',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get products {
    return Intl.message(
      'Products',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `Product Code`
  String get products_code {
    return Intl.message(
      'Product Code',
      name: 'products_code',
      desc: '',
      args: [],
    );
  }

  /// `Product Name`
  String get products_name {
    return Intl.message(
      'Product Name',
      name: 'products_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter Product Name`
  String get enter_products_name {
    return Intl.message(
      'Enter Product Name',
      name: 'enter_products_name',
      desc: '',
      args: [],
    );
  }

  /// `Product Quantity`
  String get products_quantity {
    return Intl.message(
      'Product Quantity',
      name: 'products_quantity',
      desc: '',
      args: [],
    );
  }

  /// `Enter Product Quantity`
  String get enter_products_quantity {
    return Intl.message(
      'Enter Product Quantity',
      name: 'enter_products_quantity',
      desc: '',
      args: [],
    );
  }

  /// `Product Unit Price`
  String get products_unit_price {
    return Intl.message(
      'Product Unit Price',
      name: 'products_unit_price',
      desc: '',
      args: [],
    );
  }

  /// `Enter Product Unit Price`
  String get enter_products_unit_price {
    return Intl.message(
      'Enter Product Unit Price',
      name: 'enter_products_unit_price',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Unit Price`
  String get unit_price {
    return Intl.message(
      'Unit Price',
      name: 'unit_price',
      desc: '',
      args: [],
    );
  }

  /// `Total Price`
  String get total_price {
    return Intl.message(
      'Total Price',
      name: 'total_price',
      desc: '',
      args: [],
    );
  }

  /// `N/A`
  String get not_available {
    return Intl.message(
      'N/A',
      name: 'not_available',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection.\nPlease check your network settings.`
  String get not_internet_connection {
    return Intl.message(
      'No Internet Connection.\nPlease check your network settings.',
      name: 'not_internet_connection',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Create Product`
  String get create_product {
    return Intl.message(
      'Create Product',
      name: 'create_product',
      desc: '',
      args: [],
    );
  }

  /// `Update Product`
  String get update_product {
    return Intl.message(
      'Update Product',
      name: 'update_product',
      desc: '',
      args: [],
    );
  }

  /// `Delete Confirmation`
  String get delete_confirm {
    return Intl.message(
      'Delete Confirmation',
      name: 'delete_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `No Name`
  String get no_name {
    return Intl.message(
      'No Name',
      name: 'no_name',
      desc: '',
      args: [],
    );
  }

  /// `Page not found`
  String get page_not_found {
    return Intl.message(
      'Page not found',
      name: 'page_not_found',
      desc: '',
      args: [],
    );
  }

  /// `No value is updated`
  String get no_value_updated {
    return Intl.message(
      'No value is updated',
      name: 'no_value_updated',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
