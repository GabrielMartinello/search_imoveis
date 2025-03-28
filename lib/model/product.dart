import 'dart:core';

import 'package:search_imoveis/model/company.dart';

class Product{

  String _description;
  String _price;
  String _discount;
  Company _company;

  Product(String description, String price, String discount, Company company):
      _description = description,
      _price = price,
      _discount = discount,
      _company = company;

  Company get company => _company;

  set company(Company value) {
    _company = value;
  }

  String get discount => _discount;

  set discount(String value) {
    _discount = value;
  }

  String get price => _price;

  set price(String value) {
    _price = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }
}