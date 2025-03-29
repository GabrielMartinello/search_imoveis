import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:search_imoveis/components/back_button.dart';
import 'package:search_imoveis/model/product.dart';
import 'package:search_imoveis/model/productResponse.dart';

class ProdutosFavoritos extends StatefulWidget{
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
      body:
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                  top: 50.0,
                  left: 25
              ),
              child: Row(
                children: [
                  BackButtonApp(),
                ],
              ),
            ),

            const SizedBox(height: 25),

            Expanded(child:
              ListView.builder(
                itemCount: products.length,
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                //padding: EdgeInsets.only(top: 10,bottom: 10),
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(products[index].description),
                    subtitle: Text(products[index].price),
                  );
                },
              ),
            ),
          ]
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