import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/components/pokemon_box.dart';
import 'package:pokemon_vgc/app/models/pokemon_model.dart';

class TeamBuilderHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TeamBuilderHomeState();
  }
}

class TeamBuilderHomeState extends State<TeamBuilderHome> {

  final PokemonModel Ceruledge = PokemonModel('Bitter Blade', 'move2', 'move3', 'move4', name: 'Ceruledge', lvl: 50, nature: 'Adamant', ability:'Flash Fire', hp: 75, atk: 125, def: 80, spa: 60, spd: 100, spe: 85, image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/937.png');
  final PokemonModel Armarouge = PokemonModel('move1', 'move2', 'move3', 'move4', name: 'Armarouge', lvl: 50, nature: 'Adamant', ability:'Flash Fire', hp: 75, atk: 125, def: 80, spa: 60, spd: 100, spe: 85, image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/936.png');
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Team Name')),
          backgroundColor: Colors.red,
        ),

        drawer: Drawer(
        child: Column(children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset('assets/images/red_profile.jpg')),
            accountName: const Text('Red'), 
            accountEmail: const Text('red@gmail.com'),
          ),
          ListTile(
            leading: Image.asset('assets/images/logo.png', width: 25, height: 25,),
            title: const Text('Main'),
            subtitle: const Text('Tela Inicial'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/home');
            },
          ),
          ListTile(
            leading: Image.asset('assets/images/logo.png', width: 25, height: 25,),
            title: const Text('Logout'),
            subtitle: const Text('Sair'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/');
            },
          )
        ],),
      ),
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                PokemonBox(pokemon: Ceruledge,),
                SizedBox(
                  height: 30,
                ),
                PokemonBox(pokemon: Armarouge,),
                SizedBox(
                  height: 30,
                ),
                PokemonBox(pokemon: Ceruledge,),
                SizedBox(
                  height: 30,
                ),
                PokemonBox(pokemon: Armarouge,),
                SizedBox(
                  height: 30,
                ),
                PokemonBox(pokemon: Ceruledge,),
                SizedBox(
                  height: 30,
                ),
                PokemonBox(pokemon: Armarouge,),
                
              ],
            ),
          ),
        ));
  }
}
