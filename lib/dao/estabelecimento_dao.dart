import 'package:search_imoveis/database/database_provider.dart';
import 'package:search_imoveis/model/company.dart';
import 'package:search_imoveis/model/product.dart';

class EstabelecimentoDao {
  final dbProvider = DatabaseProvider.instance;

  Future<int> insert(Company empresa) async {
    final db = await dbProvider.database;
    final result = await db.query(
      'ESTABELECIMENTO',
      where: 'name = ? AND addressType = ? AND addressName = ? AND city = ? AND uf = ?',
      whereArgs: [empresa.name, empresa.addressType, empresa.addressName, empresa.city, empresa.uf],
    );

    int companyId;
    if (result.isEmpty) {
      companyId = await db.insert('ESTABELECIMENTO', empresa.toMap());
    } else {
      companyId = result.first['ID'] as int;
    }

    return companyId;
  }
}
