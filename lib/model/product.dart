import 'package:json_annotation/json_annotation.dart';
import 'package:search_imoveis/model/company.dart';
import 'company.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {

  static const CAMPO_DESCRIPTION = 'description';
  static const CAMPO_PRICE = 'price';
  static const CAMPO_DISCOUNT = 'discount';
  static const CAMPO_COMPANY = 'company';
  static const CAMPO_USUARIO = 'usuario';
  static const nomeTabela = 'product';

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

  Map<String, dynamic> toMap(int companyId, int usuarioId) {
    return {
      CAMPO_DESCRIPTION: description,
      CAMPO_PRICE: double.parse(price),
      CAMPO_DISCOUNT: double.parse(discount),
      CAMPO_COMPANY: companyId,
      CAMPO_USUARIO: usuarioId,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    final company = Company(
      name: map['name'],
      addressType: map['addressType'],
      addressName: map['addressName'],
      city: map['city'],
      uf: map['uf'],
    );

    return Product(
      description: map[CAMPO_DESCRIPTION],
      price: map[CAMPO_PRICE].toString(),
      discount: map[CAMPO_DISCOUNT].toString(),
      company: company,
    );
  }
}
