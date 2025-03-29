import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer ({super.key});

  @override
  Widget build(BuildContext context) {
      return Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Column(
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
                          Icons.person,
                          color: Theme.of(context).colorScheme.inversePrimary),
                      title: const Text("P E R F I L"),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/perfil_page');
                      }
                  )
              ),

              Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                      leading: Icon(
                          Icons.home,
                          color: Theme.of(context).colorScheme.inversePrimary),
                      title: const Text("H O M E"),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/home');
                      }
                  )
              ),

              Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                      leading: Icon(
                          Icons.message,
                          color: Theme.of(context).colorScheme.inversePrimary),
                      title: const Text("C H A T "),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/chat_page');
                      }
                  )
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                      leading: Icon(
                          Icons.star,
                          color: Theme.of(context).colorScheme.inversePrimary),
                      title: const Text("F A V O R I T O S"),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/favoritos_page');
                      }
                  )
              )
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 25),
              child: ListTile(
                  leading: Icon(
                      Icons.logout,
                      color: Theme.of(context).colorScheme.inversePrimary),
                  title: const Text("L O G O U T"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/login_page');
                  }
              )
          ),
        ],),
      );
  }
}