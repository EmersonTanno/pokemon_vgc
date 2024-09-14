import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/components/pokemon_team_builder/pokemon_box/pokemon_box_image.dart';
import 'package:pokemon_vgc/app/components/pokemon_team_builder/pokemon_box/pokemon_box_main_info.dart';
import 'package:pokemon_vgc/app/components/pokemon_team_builder/pokemon_box/pokemon_box_moveset.dart';
import 'package:pokemon_vgc/app/components/pokemon_team_builder/pokemon_box/pokemon_box_status.dart';
import 'package:pokemon_vgc/app/models/pokemon_model.dart';

class PokemonBox extends StatelessWidget {

  final PokemonModel pokemon;

  const PokemonBox({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    
    if(pokemon.name != ''){
    return Container(
      width: screenWidth - 50,
      height: screenWidth / 4,
      child: Card(
        color: const Color.fromARGB(255, 175, 175, 175),
        child: Row(
          children: [
            // Image of the Pokemon
            PokemonBoxImage(pokemon: pokemon,),
            
            // Main info
            PokemonBoxMainInfo(pokemon: pokemon, screenWidth: screenWidth),

            SizedBox(width: 10),

            // Stats
            PokemonBoxStatus(pokemon: pokemon, screenWidth: screenWidth),

            SizedBox(width: 10),

            // Moveset
            PokemonBoxMoveset(pokemon: pokemon, screenWidth: screenWidth),
          ],
        ),
      ),
    );
    } else {
      return Container(
      width: screenWidth - 50,
      height: screenWidth / 4,
      child: Card(
        color: const Color.fromARGB(255, 175, 175, 175),
        child: Center(child: Text('Espaço Vazio'),)
      ),
    );
    }
  }
}
