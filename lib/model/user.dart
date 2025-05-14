class UserModel {
  static const CAMPO_ID = '_id';
  static const CAMPO_EMAIL = 'email';
  static const CAMPO_SENHA = 'senha';
  static const CAMPO_NOME_USUARIO = 'nomeUsuario';
  static const nomeTabela = 'usermodel';

  int? id;
  String email;
  String senha;
  String nomeUsuario;

  UserModel({
    required this.id,
    required this.email,
    required this.senha,
    required this.nomeUsuario,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      UserModel.CAMPO_EMAIL: email,
      UserModel.CAMPO_SENHA: senha,
      UserModel.CAMPO_NOME_USUARIO: nomeUsuario,
    };

    if (id != null) {
      map[UserModel.CAMPO_ID] = id;
    }

    return map;
  }

  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map[UserModel.CAMPO_ID],
      email: map[UserModel.CAMPO_EMAIL],
      senha: map[UserModel.CAMPO_SENHA],
      nomeUsuario: map[UserModel.CAMPO_NOME_USUARIO],
    );
  }
}
