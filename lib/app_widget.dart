import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/views/register_user_view.dart';
import 'package:pokemon_vgc/app/controllers/app_controller.dart';
import 'package:pokemon_vgc/app/views/home_page_view.dart';
import 'package:pokemon_vgc/app/views/team_builder_home_view.dart';
import 'package:pokemon_vgc/app/views/login_page_view.dart';

class AppWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child){
        return MaterialApp(
          theme: ThemeData(
            primaryColor: Colors.red,
            brightness: AppController.instance.isDartTheme 
            ? Brightness.dark 
            : Brightness.light
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => LoginPage(),
            '/register': (context) => RegisterUserView(),
            '/home': (context) => HomePage(),
            '/pokemonTeam': (context) => TeamBuilderHome(),
          },
        );
    });
  }
  
}