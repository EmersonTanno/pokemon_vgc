import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/models/pokemon_model.dart';

class PokemonBoxMoveset extends StatelessWidget {
  final PokemonModel pokemon;
  final double screenWidth;
  const PokemonBoxMoveset({super.key, required this.pokemon, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
            );
  }
}