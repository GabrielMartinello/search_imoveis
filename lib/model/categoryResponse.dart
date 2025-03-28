import 'package:search_imoveis/model/category.dart';

class CategoryResponse {
  List<Category> _categories;

  List<Category> get getCategories => _categories;

  set setCategories(List<Category> value) {
    _categories = value;
  }

  CategoryResponse(List<Category> categories):
      _categories = categories;

  List<Category> get categories => _categories;

  set categories(List<Category> value) {
    _categories = value;
  }
}