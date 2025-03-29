import 'package:json_annotation/json_annotation.dart';
import 'package:search_imoveis/model/company.dart';
import 'company.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  String description;
  String price;
  String discount;
  Company company;

  Product({
    required this.description,
    required this.price,
    required this.discount,
    required this.company,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
