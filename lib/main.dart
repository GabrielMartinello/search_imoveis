import 'package:flutter/material.dart';
import 'package:search_imoveis/database/database_provider.dart';
import 'package:search_imoveis/pages/auth.dart';
import 'package:search_imoveis/pages/cadastro.dart';
import 'package:search_imoveis/pages/chat.dart';
import 'package:search_imoveis/pages/home.dart';
import 'package:search_imoveis/pages/perfil.dart';
import 'package:search_imoveis/pages/produtos_favoritos.dart';
import 'package:search_imoveis/theme/dark_mode.dart';
import 'package:search_imoveis/theme/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseProvider.instance.database;
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightMode,
      darkTheme: darkMode,
      home: LoginPage(),
      routes: {
        '/home_page': (context) => Home(),
        '/chat_page': (context) => ChatDetailPage(),
        '/favoritos_page': (context) => ProdutosFavoritos(),
        '/perfil_page': (context) => PerfilPage(),
        '/login_page': (context) => LoginPage(),
        '/cadastro_page': (context) => CadastroPage(),
      }
    );
  }
}
