class Category{

  String _id;
  int _qtd;
  String _desc;

  Category(String id, int qtd, String desc):
      _id = id,
      _qtd = qtd,
      _desc = desc;

  String get desc => _desc;

  set desc(String value) {
    _desc = value;
  }

  int get qtd => _qtd;

  set qtd(int value) {
    _qtd = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}