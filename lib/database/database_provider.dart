
import 'package:search_imoveis/model/product.dart';
import 'package:search_imoveis/model/user.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static const _dbNome = 'search_imoveis.db';
  static const _dbVersion = 1;

  DatabaseProvider._init();

  static final DatabaseProvider instance = DatabaseProvider._init();

  Database? _database;

  Future<Database> get database async{
    if (_database == null){
      _database = await _initDataBase();
    }
    return _database!;
  }

  Future<Database> _initDataBase() async {
    String databasePath = await getDatabasesPath();
    String dbPath = '${databasePath}/${_dbNome}';
    return await openDatabase(
      dbPath,
      version: _dbVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${UserModel.nomeTabela} (
        ${UserModel.CAMPO_ID} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${UserModel.CAMPO_NOME_USUARIO} TEXT NOT NULL,
        ${UserModel.CAMPO_EMAIL} TEXT NOT NULL,
        ${UserModel.CAMPO_SENHA} TEXT NOT NULL
      );
    ''');

    await db.execute('''
      CREATE TABLE ESTABELECIMENTO (
        ID INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        addressType TEXT NOT NULL,
        addressName TEXT NOT NULL,
        city TEXT NOT NULL,
        uf TEXT NOT NULL
      );
    ''');

    await db.execute('''
    CREATE TABLE ${Product.nomeTabela} (
        ID INTEGER PRIMARY KEY AUTOINCREMENT,
        ${Product.CAMPO_DESCRIPTION} TEXT NOT NULL,
        ${Product.CAMPO_DISCOUNT} REAL NOT NULL,
        ${Product.CAMPO_PRICE} REAL NOT NULL,
        ${Product.CAMPO_COMPANY} INTEGER NOT NULL,
        ${Product.CAMPO_USUARIO} INTEGER NOT NULL,
        FOREIGN KEY (${Product.CAMPO_COMPANY}) REFERENCES ESTABELECIMENTO(ID),
        FOREIGN KEY (${Product.CAMPO_USUARIO}) REFERENCES ${UserModel.nomeTabela}(${UserModel.CAMPO_ID})
      );
    ''');

    await db.execute('''
    CREATE TABLE CARRINHO (
        ID INTEGER PRIMARY KEY AUTOINCREMENT,
        usuario_id INTEGER NOT NULL,
        produto_id INTEGER NOT NULL,
        quantidade INTEGER NOT NULL,
        FOREIGN KEY (usuario_id) REFERENCES ${UserModel.nomeTabela}(${UserModel.CAMPO_ID}),
        FOREIGN KEY (produto_id) REFERENCES ${Product.nomeTabela}(ID)
      );
    ''');
  }



  Future<void> close() async {
    if(_database != null){
      await _database!.close();
    }
  }

}