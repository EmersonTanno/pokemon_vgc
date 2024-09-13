import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/controllers/app_controller.dart';

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
      drawer: Drawer(
        child: Column(children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset('assets/images/red_profile.jpg')),
            accountName: Text('Red'), 
            accountEmail: Text('red@gmail.com'),
          ),
          ListTile(
            leading: Image.asset('assets/images/logo.png', width: 25, height: 25,),
            title: Text('Main'),
            subtitle: Text('Tela Inicial'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: Image.asset('assets/images/logo.png', width: 25, height: 25,),
            title: Text('Logout'),
            subtitle: Text('Sair'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/');
            },
          )
        ],),
      ),
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