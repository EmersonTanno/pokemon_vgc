import 'package:flutter/material.dart';
import 'package:pokemon_vgc/testes/app_controller.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() {
    return HomePageState();
  }

}


class HomePageState extends State<HomePage>{
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PokéCenter'),
        backgroundColor: Colors.red,
        actions: [CustomSwitcher()],
      ),
      
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Contador $count'),
          Container(
            height: 10,
          ),
          CustomSwitcher(),
          Container(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 50,
                height: 50,
                color: Colors.black,
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.red,
              )
            ],
          )
      ],),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,
        color: Colors.red,),
        onPressed: () {
          setState(() {
              count++;
            });
        },),
    );
  }

}

class CustomSwitcher extends StatelessWidget {
  const CustomSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return  Switch(
          value: AppController.instance.isDartTheme, 
          onChanged: (value){
            AppController.instance.changeTheme();
        },);
  }
}