import 'package:flutter/material.dart';
import 'package:search_imoveis/pages/chat.dart';
import 'package:search_imoveis/pages/home.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
      routes: {
        '/chat_page': (context) => ChatDetailPage()
      }
    );
  }
}
