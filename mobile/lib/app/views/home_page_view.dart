import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/components/custom_drawer/custom_drawer.dart';
import 'package:pokemon_vgc/app/components/home_page/team_box.dart';
import 'package:pokemon_vgc/app/controllers/home_page_controller.dart';
import 'package:pokemon_vgc/app/controllers/json_user_controller.dart';
import 'package:pokemon_vgc/app/models/pokemon_team_model.dart';
import 'package:pokemon_vgc/app/models/user_model.dart';
import 'package:pokemon_vgc/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late Future<List<PokemonTeamModel>> teamsFuture;
  late int userId;
  late Future<UserModel> userData;
  final HomePageController homePageController = HomePageController();
  final JsonSave jsonSave = JsonSave();

  @override
  void initState() {
    super.initState();
    userId = loggedUser;
    userData = homePageController.getUserInfo(userId);
    teamsFuture = homePageController.loadTeams(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      appBar: AppBar(
        title: Center(child: Text('Pokémon VGC')),
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder<List<PokemonTeamModel>>(
        future: teamsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar times'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum time encontrado'));
          }

          List<PokemonTeamModel> teams = snapshot.data!;

          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Color.fromARGB(255, 229, 223, 233),
            child: Center(
              child: Container(
                height: double.infinity,
                width: MediaQuery.of(context).size.width - 50,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      ...teams.map((team) => TeamBox(teamData: team)).toList(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
         backgroundColor: Color.fromARGB(255, 255, 255, 255),
        child: Icon(
          Icons.add,
          color: Colors.red,
        ),
        onPressed: () {
          setState(() {
            homePageController.createTeamAlert(context);
          });
        },
      ),
    );
  }
}
