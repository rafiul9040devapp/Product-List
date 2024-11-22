// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['_id'] as String?,
      productName: json['ProductName'] as String?,
      productCode: (json['ProductCode'] as num?)?.toInt(),
      imageUrl: json['Img'] as String?,
      quantity: (json['Qty'] as num?)?.toInt(),
      unitPrice: (json['UnitPrice'] as num?)?.toInt(),
      totalPrice: (json['TotalPrice'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'ProductName': instance.productName,
      'ProductCode': instance.productCode,
      'Img': instance.imageUrl,
      'Qty': instance.quantity,
      'UnitPrice': instance.unitPrice,
      'TotalPrice': instance.totalPrice,
    };
