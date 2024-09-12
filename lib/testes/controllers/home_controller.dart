import 'package:flutter/material.dart';
import 'package:pokemon_vgc/testes/model/currency_model.dart';

class HomeController{
  late List<CurrencyModel> currencies;

  TextEditingController toText = TextEditingController();
  TextEditingController fromText = TextEditingController();

  late CurrencyModel toCurrency;
  late CurrencyModel fromCurency;


  HomeController({ required this.toText, required this.fromText }) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurency = currencies[1];
  }


  void convert(){
    String text = toText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1.0;
    double returnValue = 0.0;

    if(fromCurency.name == 'Real'){
      returnValue = value * toCurrency.real;
    } else if(fromCurency.name == 'Dolar'){
      returnValue = value * toCurrency.dolar;
    } else if(fromCurency.name == 'Euro'){
      returnValue = value * toCurrency.euro;
    } else if(fromCurency.name == 'Bitcoin'){
      returnValue = value * toCurrency.bitcoin;
    } 

    fromText.text = returnValue.toStringAsFixed(2);
    
  }
}