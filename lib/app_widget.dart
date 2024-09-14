import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/views/register_user_view.dart';
import 'package:pokemon_vgc/app/views/home_page_view.dart';
import 'package:pokemon_vgc/app/views/team_builder_home_view.dart';
import 'package:pokemon_vgc/app/views/login_page_view.dart';

class AppWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([]),
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            primaryColor: Colors.red,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => LoginPage(),
            '/register': (context) => RegisterUserView(),
            '/home': (context) => HomePage(userId: 1),
            '/pokemonTeam': (context) => TeamBuilderHome(),
          },
        );
      },
      child: null,
    );
  }
}
