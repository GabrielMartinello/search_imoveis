// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  description: json['desc'] as String,
  price: json['valor'] as String,
  discount: json['valor_desconto'] as String,
  company: Company.fromJson(json['estabelecimento'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'desc': instance.description,
  'valor': instance.price,
  'valor_desconto': instance.discount,
  'estabelecimento': instance.company,
};
