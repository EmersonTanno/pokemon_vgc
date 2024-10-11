import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/models/pokemon_model.dart';

class PokemonBoxStatus extends StatelessWidget {
  final PokemonModel pokemon;
  final double screenWidth;
  const PokemonBoxStatus(
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
    );
  }
}
