import 'package:json_annotation/json_annotation.dart';
import 'company.dart';
part 'productPrice.g.dart';

@JsonSerializable()
class ProductPrice {
  String min;
  String max;

  ProductPrice(this.min, this.max);

  factory ProductPrice.fromJson(Map<String, dynamic> json) => _$ProductPriceFromJson(json);

  Map<String, dynamic> toJson() => _$ProductPriceToJson(this);
}
