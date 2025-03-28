import 'package:search_imoveis/model/product.dart';
import 'package:search_imoveis/model/productPrice.dart';

class ProductResponse {
  int _total;
  Product _product;
  ProductPrice _productPrice;

  ProductResponse(this._total, this._product, this._productPrice);

  ProductPrice get productPrice => _productPrice;

  set productPrice(ProductPrice value) {
    _productPrice = value;
  }

  Product get product => _product;

  set product(Product value) {
    _product = value;
  }

  int get total => _total;

  set total(int value) {
    _total = value;
  }
}