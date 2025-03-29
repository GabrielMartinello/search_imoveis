import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_imoveis/components/button_custom.dart';
import 'package:search_imoveis/components/text_field.dart';

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
                'S E A T C H - I M O V E I S',
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
                  Text("Esqueceu sua senha?", style: TextStyle(color: Theme.of(context).colorScheme.secondary),)
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

  void login() {
    Navigator.pop(context);
    Navigator.pushNamed(context, '/home_page');
  }

}
