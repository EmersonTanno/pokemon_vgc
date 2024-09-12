import 'package:flutter/material.dart';
import 'package:pokemon_vgc/testes/app_controller.dart';
import 'package:pokemon_vgc/testes/home_page.dart';
import 'package:pokemon_vgc/app/views/team_builder_home_view.dart';
import 'package:pokemon_vgc/app/views/login_page.dart';
import 'package:pokemon_vgc/testes/views/home_view.dart';

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
            '/': (context) => TeamBuilderHome(),
            '/home': (context) => HomePage(),
            '/homeTest': (context) => HomeView(),
          },
          //home: TeamBuilderHome(),
        );
    });
  }
  
}