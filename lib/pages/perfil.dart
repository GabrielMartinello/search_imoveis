import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_imoveis/components/back_button.dart';

class PerfilPage extends StatefulWidget {

  @override
  PerfilPageState createState() => PerfilPageState();

}
class PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
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
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.all(25),
              child: Icon(
                  Icons.person,
                  size: 64
              ),
            ),

            const SizedBox(height: 25),
            Text(
                'seunomedeusuario',
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                )
            ),
            const SizedBox(height: 10),
            Text(
                'umemail@gmail.com',
                style: TextStyle(
                    color: Colors.grey[600],
                )
            ),

          ]
        ),
      ),
    );
  }

}
