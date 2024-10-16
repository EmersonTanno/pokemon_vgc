import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/models/pokemon_model.dart';

class PokemonInfoBox extends StatelessWidget {
  const PokemonInfoBox(
      {super.key, required this.pokemon, required this.screenWidth});
  final PokemonModel pokemon;
  final double screenWidth;
  @override
  Widget build(BuildContext context) {
    if (pokemon.name != '-') {
      return SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.width,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
            color: const Color.fromARGB(255, 175, 175, 175),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 6,
                          height: MediaQuery.of(context).size.height / 6,
                          child: Image.network(pokemon.image, fit: BoxFit.contain),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1000,
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(color: Colors.black, width: 2.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 25,
                        ),
                        Flexible(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 200,
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Lvl: ${pokemon.lvl}',
                                  style: TextStyle(fontSize: screenWidth * 0.02),
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Nature: ${pokemon.nature}',
                                  style: TextStyle(fontSize: screenWidth * 0.02),
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Ability: ${pokemon.ability}',
                                  style: TextStyle(fontSize: screenWidth * 0.02),
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 200,
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'MoveSet:',
                                  style: TextStyle(fontSize: screenWidth * 0.02),
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '- ${pokemon.move1}',
                                  style: TextStyle(fontSize: screenWidth * 0.015),
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '- ${pokemon.move2}',
                                  style: TextStyle(fontSize: screenWidth * 0.015),
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '- ${pokemon.move3}',
                                  style: TextStyle(fontSize: screenWidth * 0.015),
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '- ${pokemon.move4}',
                                  style: TextStyle(fontSize: screenWidth * 0.015),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 50,
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(color: Colors.black, width: 2.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 25,
                        ),
                        Flexible(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 100,
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Status:',
                                  style: TextStyle(fontSize: screenWidth * 0.025),
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'HP: ${pokemon.hp}',
                                  style: TextStyle(fontSize: screenWidth * 0.017),
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Attack: ${pokemon.atk}',
                                  style: TextStyle(fontSize: screenWidth * 0.017),
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Defense: ${pokemon.def}',
                                  style: TextStyle(fontSize: screenWidth * 0.017),
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Sp. Atk: ${pokemon.spa}',
                                  style: TextStyle(fontSize: screenWidth * 0.017),
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Sp. Def: ${pokemon.spd}',
                                  style: TextStyle(fontSize: screenWidth * 0.017),
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Speed: ${pokemon.spe}',
                                  style: TextStyle(fontSize: screenWidth * 0.017),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

    }else{
      return Container(
        child: Row(
          children: [
            Text('Adicione um Pokémon'),
          ],
        ),
      );
    }
  }
}
