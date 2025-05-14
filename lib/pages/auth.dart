import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_imoveis/components/button_custom.dart';
import 'package:search_imoveis/components/text_field.dart';
import 'package:search_imoveis/dao/usuario_dao.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {

  @override
  LoginPageState createState() => LoginPageState();
  LoginPage({super.key});
}

class LoginPageState extends State<LoginPage> {
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
                'S E A R C H - I M O V E I S',
                style: TextStyle(fontSize: 20),
              ),

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
              const SizedBox(height: 10),
              Row(
                children: [
                  GestureDetector(
                    onTap: cadastrar,
                    child: Text(
                      "Cadastrar-se?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Esqueceu sua senha?", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),)
                ],
              ),
              const SizedBox(height: 25),

              ButtonCustom(text: 'Login', onTap: login)

            ],
          ),
        ),

      ),
    );
  }

  void login() async {
    final usuarioExiste = await validaUsuario();
    if(usuarioExiste) {
      salvarEmailUsuario(emailController.text.trim());
      Navigator.pop(context);
      Navigator.pushNamed(context, '/home_page');
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Usuario ou senha incorretos!.")),
    );
  }

  Future<bool> validaUsuario() async {
    final dao = UsuarioDao();
    final email = emailController.text.trim();
    final senha = passwordController.text;

    return await dao.usuarioExiste(email, senha);
  }


  void cadastrar() {
    Navigator.pop(context);
    Navigator.pushNamed(context, '/cadastro_page');
  }

  Future<void> salvarEmailUsuario(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email_usuario', email);
  }
}
