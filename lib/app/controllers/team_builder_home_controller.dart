import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/controllers/json_user_controller.dart';
import 'package:pokemon_vgc/app/models/pokemon_model.dart';
import 'package:pokemon_vgc/app/models/pokemon_team_model.dart';

class TeamBuilderHomeController {
  Future<PokemonTeamModel?> loadTeam(int userId, int teamId) async {
    JsonSave jsonSave = JsonSave();
    PokemonTeamModel? pokemonTeam; 

    Map<String, dynamic> jsonFileContent =
        await jsonSave.readJsonFromLocalStorage('users_data');
    
    List<dynamic> usersList = jsonFileContent['users'] ?? []; 

    for (var user in usersList) {
      if (user['id'] == userId) {
        List<dynamic> teams = user['teams'] ?? [];
        

        for (var team in teams) {
          if (team['team_id'] == teamId) {
            pokemonTeam = PokemonTeamModel.fromJson(team);
            break;
          }
        }
        break;
      }
    }

    return pokemonTeam;
  }


void openPokemonDetails(BuildContext context, PokemonModel pokemon) {
  double screenWidth = MediaQuery.of(context).size.width;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Text(
          pokemon.name,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        content: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height/4,
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
                Container(
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/6,
                        height: MediaQuery.of(context).size.height/6,
                        child: Image.network(pokemon.image, fit: BoxFit.contain)
                        ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height/100,
                          ),
                          Text('Lvl: ${pokemon.lvl}', style: TextStyle(fontSize: screenWidth * 0.025)),
                          Text('Nature: ${pokemon.nature}', style: TextStyle(fontSize: screenWidth * 0.025)),
                          Text('Ability: ${pokemon.ability}', style: TextStyle(fontSize: screenWidth * 0.025)),
                          SizedBox(
                            height: MediaQuery.of(context).size.height/100,
                          ),
                          Text('MoveSet:', style: TextStyle(fontSize: screenWidth * 0.025)),
                          Text('- ${pokemon.move1}', style: TextStyle(fontSize: screenWidth * 0.02)),
                          Text('- ${pokemon.move2}', style: TextStyle(fontSize: screenWidth * 0.02)),
                          Text('- ${pokemon.move3}', style: TextStyle(fontSize: screenWidth * 0.02)),
                          Text('- ${pokemon.move4}', style: TextStyle(fontSize: screenWidth * 0.02))
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height/100,
                          ),
                          Text('Status:', style: TextStyle(fontSize: screenWidth * 0.025)),
                          Text('HP ${pokemon.hp}', style: TextStyle(fontSize: screenWidth * 0.02)),
                          Text('Atk ${pokemon.atk}', style: TextStyle(fontSize: screenWidth * 0.02)),
                          Text('Def ${pokemon.def}', style: TextStyle(fontSize: screenWidth * 0.02)),
                          Text('SpA ${pokemon.spa}', style: TextStyle(fontSize: screenWidth * 0.02))
                        ]
                      )
                    ],
                  )
                ),
            
              ],
            ),
            ),
          )
          
          
          /*Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Detalhes do Pokémon',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              // Exemplo de campo editável para o nome
              TextFormField(
                initialValue: pokemon.name,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  // Implementar a lógica para atualizar o nome
                },
              ),
              SizedBox(height: 10),

              // Campo editável para o HP
              TextFormField(
                initialValue: pokemon.hp.toString(),
                decoration: InputDecoration(
                  labelText: 'HP',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  // Implementar a lógica para atualizar o HP
                },
              ),
              // Adicione mais campos para editar outras informações como moveset e stats
            ],
          ),*/
        ),
        actions: [
          // Botão para cancelar/fechar o diálogo
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Fecha o diálogo
            },
            child: Text('Voltar', style: TextStyle(color: Colors.black),),
          ),

          // Botão para salvar as alterações
          ElevatedButton(
            onPressed: () {
              // Lógica para salvar as mudanças no Pokémon
              Navigator.of(context).pop(); // Fecha o diálogo após salvar
            },
            child: Text('Editar', style: TextStyle(color: Colors.black),),
          ),
        ],
      );
    },
  );
}



}
