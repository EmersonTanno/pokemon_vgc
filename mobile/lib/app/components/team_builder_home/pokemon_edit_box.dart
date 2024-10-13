import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pokemon_vgc/app/models/pokemon_model.dart';

late PokemonModel changedPokemon;

class PokemonEditBox extends StatefulWidget {
  final PokemonModel pokemon;
  final double screenWidth;

  const PokemonEditBox(
      {super.key, required this.pokemon, required this.screenWidth});

  @override
  _PokemonInfoBoxState createState() => _PokemonInfoBoxState();
}

class _PokemonInfoBoxState extends State<PokemonEditBox> {
  late TextEditingController _nameController;
  late PokemonModel _pokemon;

  @override
  void initState() {
    PokemonModel pokemonVazio = PokemonModel(name: '-', lvl: 0, nature: '-', ability: '-', hp: 0, atk:  0, def:  0, spa:  0, spd:  0, spe:  0, image: '-', move1: '-', move2: '-', move3: '-', move4: '-');
    changedPokemon = pokemonVazio;
    super.initState();
    _pokemon = widget.pokemon;
    _nameController = TextEditingController(text: _pokemon.name);
  }

  Future<void> _fetchPokemonData(String pokemonName) async {
    String pokemonNameUrl = 'pikachu';
    if (pokemonName != '') {
      pokemonNameUrl = pokemonName;
    }
    final response = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokemonNameUrl'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      setState(() {
        _pokemon = PokemonModel(
          name: data['name'][0].toUpperCase() + data['name'].substring(1).toLowerCase(),
          image: data['sprites']['front_default'],
          lvl: 50,
          hp: data['stats'][0]['base_stat'],
          atk: data['stats'][1]['base_stat'],
          def: data['stats'][2]['base_stat'],
          spa: data['stats'][3]['base_stat'],
          spd: data['stats'][4]['base_stat'],
          spe: data['stats'][5]['base_stat'],
          ability: data['abilities'][0]['ability']['name'],
          nature: 'Bold',
          move1: data['moves'].length > 0
              ? data['moves'][0]['move']['name']
              : 'Move 1',
          move2: data['moves'].length > 1
              ? data['moves'][1]['move']['name']
              : 'Move 2',
          move3: data['moves'].length > 2
              ? data['moves'][2]['move']['name']
              : 'Move 3',
          move4: data['moves'].length > 3
              ? data['moves'][3]['move']['name']
              : 'Move 4',
        );
        if(_pokemon.name != '-'){
          changedPokemon = _pokemon;
        }
      });
    } else {
      print("Erro ao buscar o Pokémon: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
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
          child: Column(
            children: [
              Container(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  // Campo para alterar o nome do Pokémon
                  Container(
                    width: widget.screenWidth / 3,
                    child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Nome do Pokémon',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),

                  // Botão de reload para buscar as informações do Pokémon
                  IconButton(
                    icon: Icon(Icons.refresh, color: Colors.black),
                    onPressed: () {
                      _fetchPokemonData(_nameController.text.toLowerCase());
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  // Imagem do Pokémon
                  Container(
                    width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.height / 6,
                    child: _pokemon.image != "-"
                        ? Image.network(_pokemon.image, fit: BoxFit.contain)
                        : Image.asset('assets/images/logo.png',
                            fit: BoxFit.contain),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 100,
                    decoration: BoxDecoration(
                        border: Border(
                            right:
                                BorderSide(color: Colors.black, width: 2.0))),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Lvl: ${_pokemon.lvl}',
                          style:
                              TextStyle(fontSize: widget.screenWidth * 0.025)),
                      Text('Nature: ${_pokemon.nature}',
                          style:
                              TextStyle(fontSize: widget.screenWidth * 0.025)),
                      Text('Ability: ${_pokemon.ability}',
                          style:
                              TextStyle(fontSize: widget.screenWidth * 0.025)),
                      SizedBox(height: 10),
                      Text('MoveSet:',
                          style:
                              TextStyle(fontSize: widget.screenWidth * 0.025)),
                      Text('- ${_pokemon.move1}',
                          style:
                              TextStyle(fontSize: widget.screenWidth * 0.02)),
                      Text('- ${_pokemon.move2}',
                          style:
                              TextStyle(fontSize: widget.screenWidth * 0.02)),
                      Text('- ${_pokemon.move3}',
                          style:
                              TextStyle(fontSize: widget.screenWidth * 0.02)),
                      Text('- ${_pokemon.move4}',
                          style:
                              TextStyle(fontSize: widget.screenWidth * 0.02)),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Status:',
                          style:
                              TextStyle(fontSize: widget.screenWidth * 0.025)),
                      Text('HP: ${_pokemon.hp}',
                          style:
                              TextStyle(fontSize: widget.screenWidth * 0.025)),
                      Text('Attack: ${_pokemon.atk}',
                          style:
                              TextStyle(fontSize: widget.screenWidth * 0.025)),
                      Text('Defense: ${_pokemon.def}',
                          style:
                              TextStyle(fontSize: widget.screenWidth * 0.025)),
                      Text('Sp. Atk: ${_pokemon.spa}',
                          style:
                              TextStyle(fontSize: widget.screenWidth * 0.025)),
                      Text('Sp. Def: ${_pokemon.spd}',
                          style:
                              TextStyle(fontSize: widget.screenWidth * 0.025)),
                      Text('Speed: ${_pokemon.spe}',
                          style:
                              TextStyle(fontSize: widget.screenWidth * 0.025)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
