import 'package:json_annotation/json_annotation.dart';
import 'product.dart';
import 'productPrice.dart';
import 'company.dart';
part 'productResponse.g.dart';

@JsonSerializable()
class ProductResponse {
  int total;
  String local;
  List<Product> product;
  ProductPrice productPrice;

  ProductResponse({
    required this.total,
    required this.local,
    required this.product,
    required this.productPrice
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) => _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
