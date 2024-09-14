import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/components/home_page/team_box.dart';
import 'package:pokemon_vgc/app/controllers/home_page_controller.dart';
import 'package:pokemon_vgc/app/controllers/json_user_controller.dart';

class HomePage extends StatefulWidget {
  

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late Future<List<dynamic>> teamsFuture;
  late int userId;
  final HomePageController homePageController = HomePageController();
  final JsonSave jsonSave = JsonSave();

  
  @override
  void initState() {
    super.initState();
    userId = int.parse(jsonSave.returnLoggeddUser('logged_user'));

    teamsFuture = homePageController.loadTeams(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 161, 161, 161),
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset('assets/images/red_profile.jpg'),
              ),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              accountName: Text('Red ${userId}'),
              accountEmail: Text('red@gmail.com'),
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/logo.png',
                width: 25,
                height: 25,
              ),
              title: Text('Main'),
              subtitle: Text('Tela Inicial'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/home');
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/logo.png',
                width: 25,
                height: 25,
              ),
              title: Text('Logout'),
              subtitle: Text('Sair'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('PokéCenter'),
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: teamsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar times'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum time encontrado'));
          }

          List<dynamic> teams = snapshot.data!;

          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Color.fromARGB(255, 161, 161, 161),
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
        child: Icon(
          Icons.add,
          color: Colors.red,
        ),
        onPressed: () {
          setState(() {
            teamsFuture = homePageController.loadTeams(userId);
          });
        },
      ),
    );
  }
}
