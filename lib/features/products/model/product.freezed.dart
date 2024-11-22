// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductName')
  String? get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductCode')
  int? get productCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'Img')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'Qty')
  int? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'UnitPrice')
  int? get unitPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalPrice')
  int? get totalPrice => throw _privateConstructorUsedError;

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      @JsonKey(name: 'ProductName') String? productName,
      @JsonKey(name: 'ProductCode') int? productCode,
      @JsonKey(name: 'Img') String? imageUrl,
      @JsonKey(name: 'Qty') int? quantity,
      @JsonKey(name: 'UnitPrice') int? unitPrice,
      @JsonKey(name: 'TotalPrice') int? totalPrice});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? productName = freezed,
    Object? productCode = freezed,
    Object? imageUrl = freezed,
    Object? quantity = freezed,
    Object? unitPrice = freezed,
    Object? totalPrice = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      productCode: freezed == productCode
          ? _value.productCode
          : productCode // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      unitPrice: freezed == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      @JsonKey(name: 'ProductName') String? productName,
      @JsonKey(name: 'ProductCode') int? productCode,
      @JsonKey(name: 'Img') String? imageUrl,
      @JsonKey(name: 'Qty') int? quantity,
      @JsonKey(name: 'UnitPrice') int? unitPrice,
      @JsonKey(name: 'TotalPrice') int? totalPrice});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? productName = freezed,
    Object? productCode = freezed,
    Object? imageUrl = freezed,
    Object? quantity = freezed,
    Object? unitPrice = freezed,
    Object? totalPrice = freezed,
  }) {
    return _then(_$ProductImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      productCode: freezed == productCode
          ? _value.productCode
          : productCode // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      unitPrice: freezed == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  const _$ProductImpl(
      {@JsonKey(name: '_id') this.id,
      @JsonKey(name: 'ProductName') this.productName,
      @JsonKey(name: 'ProductCode') this.productCode,
      @JsonKey(name: 'Img') this.imageUrl,
      @JsonKey(name: 'Qty') this.quantity,
      @JsonKey(name: 'UnitPrice') this.unitPrice,
      @JsonKey(name: 'TotalPrice') this.totalPrice});

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  @JsonKey(name: 'ProductName')
  final String? productName;
  @override
  @JsonKey(name: 'ProductCode')
  final int? productCode;
  @override
  @JsonKey(name: 'Img')
  final String? imageUrl;
  @override
  @JsonKey(name: 'Qty')
  final int? quantity;
  @override
  @JsonKey(name: 'UnitPrice')
  final int? unitPrice;
  @override
  @JsonKey(name: 'TotalPrice')
  final int? totalPrice;

  @override
  String toString() {
    return 'Product(id: $id, productName: $productName, productCode: $productCode, imageUrl: $imageUrl, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productCode, productCode) ||
                other.productCode == productCode) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, productName, productCode,
      imageUrl, quantity, unitPrice, totalPrice);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  const factory _Product(
      {@JsonKey(name: '_id') final String? id,
      @JsonKey(name: 'ProductName') final String? productName,
      @JsonKey(name: 'ProductCode') final int? productCode,
      @JsonKey(name: 'Img') final String? imageUrl,
      @JsonKey(name: 'Qty') final int? quantity,
      @JsonKey(name: 'UnitPrice') final int? unitPrice,
      @JsonKey(name: 'TotalPrice') final int? totalPrice}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  @JsonKey(name: 'ProductName')
  String? get productName;
  @override
  @JsonKey(name: 'ProductCode')
  int? get productCode;
  @override
  @JsonKey(name: 'Img')
  String? get imageUrl;
  @override
  @JsonKey(name: 'Qty')
  int? get quantity;
  @override
  @JsonKey(name: 'UnitPrice')
  int? get unitPrice;
  @override
  @JsonKey(name: 'TotalPrice')
  int? get totalPrice;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
