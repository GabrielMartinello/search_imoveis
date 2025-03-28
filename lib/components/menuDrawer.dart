import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer ({super.key});

  @override
  Widget build(BuildContext context) {
      return Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DrawerHeader(child: Icon(
                Icons.favorite,
                color: Theme.of(context).colorScheme.inversePrimary,
              )),
              const SizedBox(height: 25),

              Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                      leading: Icon(
                          Icons.home,
                          color: Theme.of(context).colorScheme.inversePrimary),
                      title: const Text("H O M E"),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, 'home');
                      }
                  )
              ),

              Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                      leading: Icon(
                          Icons.home,
                          color: Theme.of(context).colorScheme.inversePrimary),
                      title: const Text("C H A T S"),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, 'chat_page');
                      }
                  )
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 25),
              child: ListTile(
                  leading: Icon(
                      Icons.home,
                      color: Theme.of(context).colorScheme.inversePrimary),
                  title: const Text("L O G O U T"),
                  onTap: () {
                    Navigator.pop(context);
                  }
              )
          ),


        ],),
      );
  }
}