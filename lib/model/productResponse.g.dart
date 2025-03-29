// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      total: (json['total'] as num).toInt(),
      product:
          (json['produtos'] as List<dynamic>)
              .map((e) => Product.fromJson(e as Map<String, dynamic>))
              .toList(),
      productPrice: ProductPrice.fromJson(
        json['precos'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'produtos': instance.product,
      'precos': instance.productPrice,
    };
