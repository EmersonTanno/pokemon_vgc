import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/components/custom_drawer/custom_drawer.dart';
import 'package:pokemon_vgc/app/components/pokemon_team_builder/pokemon_box/pokemon_box.dart';
import 'package:pokemon_vgc/app/controllers/home_page_controller.dart';
import 'package:pokemon_vgc/app/controllers/json_user_controller.dart';
import 'package:pokemon_vgc/app/controllers/team_builder_home_controller.dart';
import 'package:pokemon_vgc/app/models/pokemon_model.dart';
import 'package:pokemon_vgc/app/models/pokemon_team_model.dart';
import 'package:pokemon_vgc/app/models/user_model.dart';

class TeamBuilderHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TeamBuilderHomeState();
  }
}

class TeamBuilderHomeState extends State<TeamBuilderHome> {

  final PokemonModel Ceruledge = PokemonModel(name: 'Ceruledge', lvl: 50, nature: 'Adamant', ability:'Flash Fire', hp: 75, atk: 125, def: 80, spa: 60, spd: 100, spe: 85, image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/937.png', move1: 'Bitter Blade', move2: 'Bitter Blade', move3: 'Bitter Blade', move4: 'Bitter Blade');
  final PokemonModel Armarouge = PokemonModel(name: 'Armarouge', lvl: 50, nature: 'Adamant', ability:'Flash Fire', hp: 75, atk: 125, def: 80, spa: 60, spd: 100, spe: 85, image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/936.png', move1: 'Armor Cannon', move2: 'Armor Cannon', move3: 'Armor Cannon', move4: 'Armor Cannon',);

  late Future<List<dynamic>> teamsFuture;
  late int userId;
  late int teamId;
  late Future<UserModel> userData;
  late Future<PokemonTeamModel?> teamData;
  final TeamBuilderHomeController teamBuilderHomeController = TeamBuilderHomeController();
  final JsonSave jsonSave = JsonSave();
  final HomePageController homePageController = HomePageController();

    @override
  void initState() {
    super.initState();
    userId = int.parse(jsonSave.returnJsonId('logged_user'));
    teamId = int.parse(jsonSave.returnJsonId('team_data'));
    teamData = teamBuilderHomeController.loadTeam(userId, teamId);
    userData = homePageController.getUserInfo(userId);
  }


 @override
Widget build(BuildContext context) {
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


    body: FutureBuilder<PokemonTeamModel?>(
      future: teamData, 
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Erro ao carregar o time.'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Center(child: Text('Nenhum time encontrado.'));
        }

        PokemonTeamModel team = snapshot.data!;

        return Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                PokemonBox(pokemon: team.pokemon1),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1000,
                ),
                PokemonBox(pokemon: team.pokemon2),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1000,
                ),
                PokemonBox(pokemon: team.pokemon3),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1000,
                ),
                PokemonBox(pokemon: team.pokemon4),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1000,
                ),
                PokemonBox(pokemon: team.pokemon5),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1000,
                ),
                PokemonBox(pokemon: team.pokemon6),
              ],
            ),
          ),
        );
      },
    ),
  );
}

        
}
