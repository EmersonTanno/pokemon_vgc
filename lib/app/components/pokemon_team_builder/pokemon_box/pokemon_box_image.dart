import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/models/pokemon_model.dart';

class PokemonBoxImage extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonBoxImage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        height: double.infinity,
        child: Image.network('${pokemon.image}', fit: BoxFit.contain),
      ),
    );
  }
}
