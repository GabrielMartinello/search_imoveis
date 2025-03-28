import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_imoveis/components/menuDrawer.dart';

class Home extends StatelessWidget {

  void logout () {
    printToConsole("LOGOUUTEE");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Teste"),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(onPressed: logout, icon: Icon(Icons.logout))
        ],
      ),
      drawer: MenuDrawer(),
    );
  }


}
