import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:search_imoveis/components/back_button.dart';
import 'package:search_imoveis/model/product.dart';
import 'package:search_imoveis/model/productResponse.dart';
import 'package:search_imoveis/pages/DetalhesProdutoPage.dart';

class ProdutosFavoritos extends StatefulWidget {
  @override
  _ProdutosFavoritosState createState() => _ProdutosFavoritosState();
}

class _ProdutosFavoritosState extends State<ProdutosFavoritos> {
  String jsonData = "";

  @override
  void initState() {
    super.initState();
    loadJson('assets/mocks/productMock.json');
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> json = jsonDecode(jsonData);
    List<Product> products = ProductResponse.fromJson(json).product;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 50.0, left: 25),
            child: Row(
              children: [
                BackButtonApp(),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              padding: const EdgeInsets.all(0),
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetalhesProdutoPage(produto: products[index]),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  products[index].description,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Preço: R\$ ${products[index].price}',
                                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Desconto: ${products[index].discount}%',
                                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> loadJson(String path) async {
    String jsonString = await rootBundle.loadString(path);
    setState(() {
      jsonData = jsonString;
    });
  }
}
