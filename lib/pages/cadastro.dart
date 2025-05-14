import 'package:flutter/material.dart';
import 'package:search_imoveis/components/button_custom.dart';
import 'package:search_imoveis/components/text_field.dart';
import 'package:search_imoveis/dao/usuario_dao.dart';
import 'package:search_imoveis/model/user.dart';

class CadastroPage extends StatefulWidget {

  @override
  CadastroPageState createState() => CadastroPageState();
  CadastroPage({super.key});
}

class CadastroPageState extends State<CadastroPage> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(height: 25,),
              const Text(
                'C A D A S T R O',
                style: TextStyle(fontSize: 20),
              ),
              TextFieldCustom(
                  hintText: 'Nome',
                  obscureText: false,
                  controller: nomeController
              ),
              const SizedBox(height: 10),
              TextFieldCustom(
                  hintText: 'E-mail',
                  obscureText: false,
                  controller: emailController
              ),
              const SizedBox(height: 10),
              TextFieldCustom(
                  hintText: 'Senha',
                  obscureText: true,
                  controller: passwordController
              ),

              const SizedBox(height: 25),

              ButtonCustom(text: 'Cadastrar', onTap: login)

            ],
          ),
        ),

      ),
    );
  }

  void login() async {
    final cadastradoSucesso = await cadastrar();

    if (cadastradoSucesso) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Usuário cadastrado com sucesso!")),
      );
      Navigator.pop(context);
      Navigator.pushNamed(context, '/login_page');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Erro ao salvar o usuário.")),
      );
    }
  }

  Future<bool> cadastrar() async {
    final nome = nomeController.text.trim();
    final email = emailController.text.trim();
    final senha = passwordController.text;

    if (nome.isEmpty || email.isEmpty || senha.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Preencha todos os campos.")),
      );
      return false;
    }

    if(nome.length < 5) {
      const SnackBar(content: Text("Preencha o nome completo."));
      return false;
    }

    if(senha.length < 5) {
      const SnackBar(content: Text("Senha precisa ser maior que 5 caracteres!."));
      return false;
    }

    if(!email.contains("@")) {
      const SnackBar(content: Text("Preencha um e-mail válido!."));
      return false;
    }

    final dao = UsuarioDao();

    final existe = await dao.emailExiste(email);
    if (existe) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Este e-mail já está cadastrado.")),
      );
      return false;
    }

    final novoUsuario = UserModel(
      id: null,
      nomeUsuario: nome,
      email: email,
      senha: senha,
    );

    return await dao.salvar(novoUsuario);
  }

}
