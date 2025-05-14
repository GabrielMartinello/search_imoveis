import 'package:search_imoveis/database/database_provider.dart';
import 'package:search_imoveis/model/product.dart';

class ProductDao{
  final dbProvider = DatabaseProvider.instance;

  Future<int> insert(Product product, int companyId, int usuarioId) async {
    final db = await dbProvider.database;
    return await db.insert(Product.nomeTabela, product.toMap(companyId, usuarioId));
  }
}