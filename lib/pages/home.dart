import 'package:flutter/material.dart';
import 'package:search_imoveis/components/menuDrawer.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0
      ),
      drawer: MenuDrawer(),
    );
  }


}
