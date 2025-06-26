import 'package:flutter/material.dart';
import 'package:search_imoveis/model/product.dart';
import 'package:maps_launcher/maps_launcher.dart';

class DetalhesProdutoPage extends StatelessWidget {
  final Product produto;

  DetalhesProdutoPage({required this.produto});

  void _abrirNoGPS(String endereco) {
    MapsLauncher.launchQuery(endereco);
  }

  @override
  Widget build(BuildContext context) {
    final empresa = produto.company;
    final endereco =
        "${empresa.addressType} ${empresa.addressName}, ${empresa.city} - ${empresa.uf}";

    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do Produto"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(produto.description,
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text("Preço: R\$ ${produto.price}",
                      style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10),
                  Text("Desconto: ${produto.discount}%",
                      style: TextStyle(fontSize: 18)),
                  SizedBox(height: 20),
                  Text("Empresa: ${empresa.name}",
                      style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                  SizedBox(height: 5),
                  GestureDetector(
                    onTap: () => _abrirNoGPS(endereco),
                    child: Text(
                      "Endereço: $endereco",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
