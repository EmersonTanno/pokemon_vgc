import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/models/user_model.dart';

class CustomDrawer extends StatelessWidget {
  final UserModel? user; // O usuário pode ser nulo enquanto carrega
  final VoidCallback onLogout;
  final VoidCallback onNavigateHome;

  const CustomDrawer({
    Key? key,
    required this.user,
    required this.onLogout,
    required this.onNavigateHome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 161, 161, 161),
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset('assets/images/premier_ball_logo.png'),
            ),
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            accountName: Text(user?.name ?? 'Carregando...'),
            accountEmail: Text(user?.email ?? 'Carregando...'),
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/logo.png',
              width: 25,
              height: 25,
            ),
            title: Text('Main'),
            subtitle: Text('Tela Inicial'),
            onTap: onNavigateHome,
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/logo.png',
              width: 25,
              height: 25,
            ),
            title: Text('Logout'),
            subtitle: Text('Sair'),
            onTap: onLogout,
          ),
        ],
      ),
    );
  }
}
