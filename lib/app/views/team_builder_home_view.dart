import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/components/pokemon_box.dart';
import 'package:pokemon_vgc/app/models/pokemon_model.dart';
import 'package:pokemon_vgc/app/models/pokemon_team_model.dart';

class TeamBuilderHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TeamBuilderHomeState();
  }
}

class TeamBuilderHomeState extends State<TeamBuilderHome> {

  final PokemonModel Ceruledge = PokemonModel('Bitter Blade', 'Bitter Blade', 'Bitter Blade', 'Bitter Blade', name: 'Ceruledge', lvl: 50, nature: 'Adamant', ability:'Flash Fire', hp: 75, atk: 125, def: 80, spa: 60, spd: 100, spe: 85, image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/937.png');
  final PokemonModel Armarouge = PokemonModel('Armor Cannon', 'Armor Cannon', 'Armor Cannon', 'Armor Cannon', name: 'Armarouge', lvl: 50, nature: 'Adamant', ability:'Flash Fire', hp: 75, atk: 125, def: 80, spa: 60, spd: 100, spe: 85, image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/936.png');

  @override
  Widget build(BuildContext context) {
     final PokemonTeamModel team = PokemonTeamModel('Armor', Ceruledge, Armarouge, Ceruledge, Armarouge, Ceruledge, Armarouge);
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(team.team_name)),
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
                PokemonBox(pokemon: team.pokemon1,),
                SizedBox(
                  height: MediaQuery.of(context).size.height/1000,
                ),
                PokemonBox(pokemon: team.pokemon2,),
                SizedBox(
                  height: MediaQuery.of(context).size.height/1000,
                ),
                PokemonBox(pokemon: team.pokemon3,),
                SizedBox(
                  height: MediaQuery.of(context).size.height/1000,
                ),
                PokemonBox(pokemon: team.pokemon4,),
                SizedBox(
                  height: MediaQuery.of(context).size.height/1000,
                ),
                PokemonBox(pokemon: team.pokemon5,),
                SizedBox(
                  height: MediaQuery.of(context).size.height/1000,
                ),
                PokemonBox(pokemon: team.pokemon6,),
                
              ],
            ),
          ),
        ));
  }
}
