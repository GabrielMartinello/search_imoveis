import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:search_imoveis/model/category.dart';
import 'package:search_imoveis/model/productResponse.dart';
import 'package:search_imoveis/pages/produtos_page.dart';

class CategoriasPage extends StatelessWidget {
  final List<Category> categorias;
  final String termo;

  CategoriasPage({required this.categorias, required this.termo});

  Future<void> buscarProdutosPorCategoria(BuildContext context, int categoriaId) async {
    final url = Uri.parse(
        'https://menorpreco.notaparana.pr.gov.br/api/v1/produtos?local=6gkzqf9vb&termo=${Uri.encodeComponent(termo)}&categoria=$categoriaId&offset=0&raio=2&data=-1&ordem=0'
    );

    try {
      final response = await http.get(url, headers: {
        'Accept': 'application/json, text/plain, */*',
        'Accept-Language': 'pt-BR,pt;q=0.9',
        'Referer': 'https://menorpreco.notaparana.pr.gov.br/app?termo=$termo&local=6gkzqf9vb',
        'User-Agent': 'Mozilla/5.0 (Flutter; Mobile)',
        'X-KL-saas-Ajax-Request': 'Ajax_Request',
      });

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final productResponse = ProductResponse.fromJson(json);

        Navigator.pop(context);
        Navigator.pushNamed(context, '/produtos_page');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao buscar produtos: ${response.statusCode}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categorias Encontradas")),
      body: ListView.builder(
        itemCount: categorias.length,
        itemBuilder: (context, index) {
          final categoria = categorias[index];
          return ListTile(
            title: Text(categoria.desc),
            subtitle: Text("Qtd: ${categoria.qtd}"),
            trailing: Icon(Icons.chevron_right),
            onTap: () => buscarProdutosPorCategoria(context, categoria.id),
          );
        },
      ),
    );
  }
}
