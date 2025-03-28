class ProductPrice {
  String _min;
  String _max;

  ProductPrice(this._min, this._max);

  String get max => _max;

  set max(String value) {
    _max = value;
  }

  String get min => _min;

  set min(String value) {
    _min = value;
  }
}
