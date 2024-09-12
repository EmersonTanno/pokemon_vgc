import 'package:flutter/material.dart';
import 'package:pokemon_vgc/testes/components/currency_box.dart';
import 'package:pokemon_vgc/testes/controllers/home_controller.dart';

class HomeView extends StatefulWidget {

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  final TextEditingController toText = TextEditingController();  

  final TextEditingController fromText = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 100, bottom: 20),
          child: Column(
            children: [
              Image.asset('assets/images/logo.png', width: 300, height: 300,),
              SizedBox(height: 40,),
              CurrencyBox(selectItem: homeController.toCurrency, controller: toText, items: homeController.currencies, onChanged: (model){ 
                setState(() {
                  homeController.toCurrency = model;
                });
               },),
              SizedBox(height: 10,),
              CurrencyBox(selectItem: homeController.fromCurency, controller: fromText, items: homeController.currencies, onChanged: (model){
                setState(() {
                  homeController.toCurrency = model;
                });
              },),
              SizedBox(height: 20,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  homeController.convert();
                }, child: Text('CONVERT',
                  style: TextStyle(color: Colors.white),))
          ],),
        ),
      )
    );
  }
}