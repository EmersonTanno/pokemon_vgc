import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_vgc/testes/controllers/home_controller.dart';

main() {
  final TextEditingController toText = TextEditingController();  
  final TextEditingController fromText = TextEditingController(); 
  final homeController = HomeController(toText: toText, fromText: fromText);


  test('deve converter real para dolar', () {
    toText.text = '2.0';
    homeController.convert();
    expect(fromText.text, '0.36');
  });
}