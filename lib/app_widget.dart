import 'package:flutter/material.dart';
import 'package:pokemon_vgc/testes/app_controller.dart';
import 'package:pokemon_vgc/testes/home_page.dart';
import 'package:pokemon_vgc/team_builder/team_builder_home.dart';
import 'package:pokemon_vgc/testes/login_page.dart';

class AppWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child){
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.red,
            brightness: AppController.instance.isDartTheme 
            ? Brightness.dark 
            : Brightness.light
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => LoginPage(),
            '/home': (context) => HomePage(),
          },
          //home: TeamBuilderHome(),
        );
    });
  }
  
}