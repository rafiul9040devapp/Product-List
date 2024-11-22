import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    @JsonKey(name: '_id') String? id,
    @JsonKey(name: 'ProductName') String? productName,
    @JsonKey(name: 'ProductCode') int? productCode,
    @JsonKey(name: 'Img') String? imageUrl,
    @JsonKey(name: 'Qty') int? quantity,
    @JsonKey(name: 'UnitPrice') int? unitPrice,
    @JsonKey(name: 'TotalPrice') int? totalPrice,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
