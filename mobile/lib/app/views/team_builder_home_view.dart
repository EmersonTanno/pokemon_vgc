import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/components/custom_drawer/custom_drawer.dart';
import 'package:pokemon_vgc/app/components/team_builder_home/pokemon_box/pokemon_box.dart';
import 'package:pokemon_vgc/app/controllers/home_page_controller.dart';
import 'package:pokemon_vgc/app/controllers/json_user_controller.dart';
import 'package:pokemon_vgc/app/controllers/team_builder_home_controller.dart';
import 'package:pokemon_vgc/app/models/pokemon_team_model.dart';
import 'package:pokemon_vgc/app/models/user_model.dart';
import 'package:pokemon_vgc/main.dart';

class TeamBuilderHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TeamBuilderHomeState();
  }
}

class TeamBuilderHomeState extends State<TeamBuilderHome> {
  late Future<List<dynamic>> teamsFuture;
  late int userId;
  late int teamId;
  late Future<UserModel> userData;
  late Future<PokemonTeamModel?> teamData;
  final TeamBuilderHomeController teamBuilderHomeController =
      TeamBuilderHomeController();
  final JsonSave jsonSave = JsonSave();
  final HomePageController homePageController = HomePageController();

  @override
  void initState() {
    super.initState();
    userId = loggedUser;
    //teamId = int.parse(jsonSave.returnJsonId('team_data'));
    //teamData = teamBuilderHomeController.loadTeam(userId, teamId);
    userData = homePageController.getUserInfo(userId);
  }

  @override
  Widget build(BuildContext context) {
    final PokemonTeamModel pokemonData = ModalRoute.of(context)?.settings.arguments as PokemonTeamModel;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Team Builder')),
        backgroundColor: Colors.red,
      ),
      drawer: FutureBuilder<UserModel>(
        future: userData,
        builder: (context, snapshot) {
          UserModel? user = snapshot.data;
          return CustomDrawer(
            user: user,
            onLogout: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            onNavigateHome: () {
              Navigator.of(context).pushReplacementNamed('/home');
            },
          );
        },
      ),
      body:Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  PokemonBox(pokemon: pokemonData.pokemon1),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1000,
                  ),
                  PokemonBox(pokemon: pokemonData.pokemon2),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1000,
                  ),
                  PokemonBox(pokemon: pokemonData.pokemon3),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1000,
                  ),
                  PokemonBox(pokemon: pokemonData.pokemon4),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1000,
                  ),
                  PokemonBox(pokemon: pokemonData.pokemon5),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1000,
                  ),
                  PokemonBox(pokemon: pokemonData.pokemon6),
                ],
              ),
            ),
          ),


      floatingActionButton:FloatingActionButton(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.dangerous,
                color: Colors.red,
              ),
              onPressed: () {
                teamBuilderHomeController.deleteDialog(
                  context,
                  pokemonData.team_name,
                  pokemonData.id,
                );
              },
            ),
    );
  }
}
