import 'package:flutter/material.dart';
import 'package:search_imoveis/components/menuDrawer.dart';
import 'package:http/http.dart' as http;
import 'package:search_imoveis/model/categoryResponse.dart';
import 'dart:convert';
import 'categorias_page.dart'; // importe sua nova tela

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;

  Future<void> _buscarProduto() async {
    final termo = _controller.text.trim();
    if (termo.isEmpty) return;

    setState(() {
      _isLoading = true;
    });

    final url = Uri.parse(
        'https://menorpreco.notaparana.pr.gov.br/api/v1/categorias?local=6g6dc3jcw&termo=${Uri.encodeComponent(termo)}');

    try {
      final response = await http.get(url, headers: {
        'Accept': 'application/json, text/plain, */*',
        'Accept-Language': 'pt-BR,pt;q=0.9',
        'Referer':
        'https://menorpreco.notaparana.pr.gov.br/app?termo=$termo&local=6g6dc3jcw',
        'User-Agent': 'Mozilla/5.0 (Flutter; Mobile)',
        'X-KL-saas-Ajax-Request': 'Ajax_Request',
      });

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final categoryResponse = CategoryResponse.fromJson(json);

        // Navega para a nova tela com os dados
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoriasPage(categorias: categoryResponse.categories, termo: termo),
          ),
        );
      } else {
        _mostrarErro("Erro: ${response.statusCode}");
      }
    } catch (e) {
      _mostrarErro("Erro ao buscar produto: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _mostrarErro(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensagem)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      drawer: MenuDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "O que você procura?\nDigite o nome do produto que está buscando.",
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Ex: arroz, parafuso, leite...",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            ElevatedButton.icon(
              icon: Icon(Icons.search),
              label: Text("Pesquisar"),
              onPressed: _isLoading ? null : _buscarProduto,
            ),
            if (_isLoading) SizedBox(height: 20),
            if (_isLoading) CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
