import 'package:search_imoveis/database/database_provider.dart';
import 'package:search_imoveis/model/company.dart';
import 'package:search_imoveis/model/product.dart';

class ProductDao{
  final dbProvider = DatabaseProvider.instance;

  Future<int> insert(Product product, int companyId, int usuarioId) async {
    final db = await dbProvider.database;
    return await db.insert(Product.nomeTabela, product.toMap(companyId, usuarioId));
  }

  Future<List<Product>> findAllWithCompany() async {
    final db = await dbProvider.database;

    final result = await db.rawQuery('''
      SELECT p.ID, p.description, p.price, p.discount, p.${Product.CAMPO_COMPANY}, p.${Product.CAMPO_USUARIO},
             e.ID as empresa_id, e.name, e.addressType, e.addressName, e.city, e.uf
      FROM ${Product.nomeTabela} p
      INNER JOIN ESTABELECIMENTO e ON p.${Product.CAMPO_COMPANY} = e.ID
    ''');

    List<Product> products = result.map((row) {
      final company = Company(
        name: row['name'] as String,
        addressType: row['addressType'] as String,
        addressName: row['addressName'] as String,
        city: row['city'] as String,
        uf: row['uf'] as String,
      );

      return Product(
        id: row['ID'] as int?,
        description: row['description'] as String,
        price: (row['price'] as num).toString(),
        discount: (row['discount'] as num).toString(),
        company: company,
      );
    }).toList();

    return products;
  }
}