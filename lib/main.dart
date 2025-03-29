import 'package:flutter/material.dart';
import 'package:search_imoveis/pages/chat.dart';
import 'package:search_imoveis/pages/home.dart';
import 'package:search_imoveis/pages/perfil.dart';
import 'package:search_imoveis/pages/produtos.dart';
import 'package:search_imoveis/theme/dark_mode.dart';
import 'package:search_imoveis/theme/light_mode.dart';

void main() {
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
      home: Home(),
      routes: {
        '/chat_page': (context) => ChatDetailPage(),
        '/favoritos_page': (context) => ProdutosFavoritos(),
        '/perfil_page': (context) => PerfilPage(),
      }
    );
  }
}
