import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/models/pokemon_model.dart';

class PokemonBoxMainInfo extends StatelessWidget {
  final PokemonModel pokemon;
  final double screenWidth;
  const PokemonBoxMainInfo(
      {super.key, required this.pokemon, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
