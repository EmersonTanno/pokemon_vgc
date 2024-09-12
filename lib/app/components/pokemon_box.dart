import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/models/pokemon_model.dart';

class PokemonBox extends StatelessWidget {

  final PokemonModel pokemon;

  const PokemonBox({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    
    return Container(
      width: screenWidth - 50,
      height: screenWidth / 4,
      child: Card(
        color: const Color.fromARGB(255, 175, 175, 175),
        child: Row(
          children: [
            // Image of the Pokemon
            Expanded(
              flex: 2, 
              child: Container(
                height: double.infinity,
                child: Image.network(
                    '${pokemon.image}',
                    fit: BoxFit.contain), 
              ),
            ),
            
            // Main info
            Expanded(
              flex: 3, 
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: Colors.black))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${pokemon.name}',
                      style: TextStyle(fontSize: screenWidth * 0.03),
                    ),
                    Text(
                      '- Lvl: ${pokemon.lvl}',
                      style: TextStyle(fontSize: screenWidth * 0.02), 
                    ),
                    Text(
                      '- Nature: ${pokemon.nature}',
                      style: TextStyle(fontSize: screenWidth * 0.02), 
                    ),
                    Text(
                      '- Ability: ${pokemon.ability}',
                      style: TextStyle(fontSize: screenWidth * 0.02), 
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(width: 10),

            // Stats
            Expanded(
              flex: 3, 
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: Colors.black))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '- HP: ${pokemon.hp}',
                      style: TextStyle(fontSize: screenWidth * 0.02), 
                    ),
                    Text(
                      '- Atk: ${pokemon.atk}',
                      style: TextStyle(fontSize: screenWidth * 0.02), 
                    ),
                    Text(
                      '- Def: ${pokemon.def}',
                      style: TextStyle(fontSize: screenWidth * 0.02), 
                    ),
                    Text(
                      '- SpA: ${pokemon.spa}',
                      style: TextStyle(fontSize: screenWidth * 0.02), 
                    ),
                    Text(
                      '- SpD: ${pokemon.spd}',
                      style: TextStyle(fontSize: screenWidth * 0.02), 
                    ),
                    Text(
                      '- Spe: ${pokemon.spe}',
                      style: TextStyle(fontSize: screenWidth * 0.02), 
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(width: 10),

            // Moveset
            Expanded(
              flex: 5, 
              child: Container(
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Move Set:',
                      style: TextStyle(fontSize: screenWidth * 0.03), 
                    ),
                    if(pokemon.move1 != 'move1')
                    Text(
                      '- ${pokemon.move1}',
                      style: TextStyle(fontSize: screenWidth * 0.03), 
                    ),
                    if(pokemon.move2 != 'move2')
                    Text(
                      '- ${pokemon.move2}',
                      style: TextStyle(fontSize: screenWidth * 0.03), 
                    ),
                    if(pokemon.move3 != 'move3')
                    Text(
                      '- ${pokemon.move3}',
                      style: TextStyle(fontSize: screenWidth * 0.03), 
                    ),
                    if(pokemon.move4 != 'move4')
                    Text(
                      '- ${pokemon.move4}',
                      style: TextStyle(fontSize: screenWidth * 0.03), 
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
