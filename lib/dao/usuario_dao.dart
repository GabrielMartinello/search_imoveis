import 'package:search_imoveis/database/database_provider.dart';
import 'package:search_imoveis/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsuarioDao {
  final dbProvider = DatabaseProvider.instance;

  Future<bool> salvar(UserModel usuario) async{
    final db = await dbProvider.database;
    final valores = usuario.toMap();
    if (usuario.id == null){
      usuario.id = await db.insert(UserModel.nomeTabela, valores);
      return true;
    }else{
      final registrosAtualizados = await db.update(UserModel.nomeTabela, valores,
          where: '${UserModel.CAMPO_ID} = ?', whereArgs: [usuario.id]);
      return registrosAtualizados > 0;
    }
  }

  Future<bool> remover (int id) async{
    final db = await dbProvider.database;
    final registrosAtualizados = await db.delete(UserModel.nomeTabela,
        where:  '${UserModel.CAMPO_ID} = ?', whereArgs: [id]);
    return registrosAtualizados > 0;
  }

  Future<bool> emailExiste(String email) async {
    final db = await dbProvider.database;
    final result = await db.query(
      UserModel.nomeTabela,
      where: '${UserModel.CAMPO_EMAIL} = ?',
      whereArgs: [email],
    );
    return result.isNotEmpty;
  }

  Future<bool> usuarioExiste(String email, String password) async {
    final db = await dbProvider.database;
    final result = await db.query(
      UserModel.nomeTabela,
      where: '${UserModel.CAMPO_EMAIL} = ? AND ${UserModel.CAMPO_SENHA} = ?',
      whereArgs: [email, password],
    );
    return result.isNotEmpty;
  }

  Future<UserModel?> findUserByEmail(String email) async {
    final db = await dbProvider.database;
    final result = await db.query(
      UserModel.nomeTabela,
      where: '${UserModel.CAMPO_EMAIL} = ?',
      whereArgs: [email],
    );

    if (result.isNotEmpty) {
      return UserModel.fromMap(result.first);
    } else {
      return null;
    }
  }

    Future<UserModel?> obterUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email_usuario');
    UserModel? usuarioLogado;

    if (email != null) {
      final dao = UsuarioDao();
      final user = await dao.findUserByEmail(email);

      if (user != null) {
        usuarioLogado = new UserModel(id: user.id, email: user.email, senha: user.senha, nomeUsuario: user.nomeUsuario);
      }
    }

    return usuarioLogado;
  }
}
