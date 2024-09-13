import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/components/home_page/team_box.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset('assets/images/red_profile.jpg')),
              accountName: Text('Red'),
              accountEmail: Text('red@gmail.com'),
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/logo.png',
                width: 25,
                height: 25,
              ),
              title: Text('Main'),
              subtitle: Text('Tela Inicial'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/pokemonTeam');
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/logo.png',
                width: 25,
                height: 25,
              ),
              title: Text('Logout'),
              subtitle: Text('Sair'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('PokéCenter'),
        backgroundColor: Colors.red,
      ),

      body: Center(
        child: Container(
          color: Colors.green,
          height: double.infinity,
          width: MediaQuery.of(context).size.width - 50,
          child: SingleChildScrollView(
            child: Column(
              children: [
            
            //================================================================
            
                TeamBox(),
                TeamBox(),
                TeamBox(),
                TeamBox(),
                TeamBox(),
                TeamBox(),
                TeamBox(),
                TeamBox(),
                TeamBox(),
                TeamBox(),
            
            //==============================================================
            
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.red,
        ),
        onPressed: () {
          setState(() {});
        },
      ),
    );
  }
}
