import 'package:flutter/material.dart';
import 'package:search_imoveis/components/back_button.dart';
import 'package:search_imoveis/dao/estabelecimento_dao.dart';
import 'package:search_imoveis/dao/product_dao.dart';
import 'package:search_imoveis/dao/usuario_dao.dart';
import 'package:search_imoveis/database/database_provider.dart';
import 'package:search_imoveis/model/product.dart';
import 'package:search_imoveis/model/productResponse.dart';
import 'package:search_imoveis/model/user.dart';
import 'package:search_imoveis/pages/DetalhesProdutoPage.dart';

class ProdutosPage extends StatefulWidget {
  final ProductResponse productResponse;

  ProdutosPage({required this.productResponse});

  @override
  _ProdutosPageState createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  final UsuarioDao usuarioDao = UsuarioDao();
  final ProductDao dao = ProductDao();
  final EstabelecimentoDao estabelecimentoDao = EstabelecimentoDao();

  Map<int, bool> favoritos = {};

  Future<void> salvarProdutoComEstabelecimento(Product product, BuildContext context) async {
    final empresa = product.company;
    final int companyId = await estabelecimentoDao.insert(empresa);

    UserModel? usuario = await usuarioDao.obterUsuario();
    int userId = usuario?.id ?? 1;

    await dao.insert(product, companyId, userId);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Produto salvo nos favoritos!')),
    );

    setState(() {
      favoritos[product.id ?? product.hashCode] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Product> products = widget.productResponse.product;

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
                final product = products[index];
                final int productKey = product.id ?? product.hashCode;
                final bool isFavorito = favoritos[productKey] ?? false;

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
                          builder: (_) => DetalhesProdutoPage(produto: product),
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
                                  product.description,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Preço: R\$ ${product.price}',
                                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Desconto: ${product.discount}%',
                                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              isFavorito ? Icons.star : Icons.star_border,
                              color: isFavorito ? Colors.amber : Colors.grey,
                            ),
                            tooltip: isFavorito ? 'Favorito' : 'Adicionar aos favoritos',
                            onPressed: () async {
                              if (!isFavorito) {
                                await salvarProdutoComEstabelecimento(product, context);
                              }
                            },
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
}

