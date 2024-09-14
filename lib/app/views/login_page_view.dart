import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/components/login_page/button_login_page.dart';
import 'package:pokemon_vgc/app/controllers/json_user_controller.dart';
import 'package:pokemon_vgc/app/controllers/login_page_controller.dart';
import 'package:pokemon_vgc/app/models/pokemon_model.dart';
import 'package:pokemon_vgc/app/models/pokemon_team_model.dart';
import 'package:pokemon_vgc/app/models/user_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final JsonSave jsonSave = JsonSave();
  late LoginPageController loginPageController;
  @override
  void initState() {
    super.initState();
    loginPageController = LoginPageController();
  }

  String username = '';
  String password = '';

  Widget _body() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () async {
                    // Cria um usuário fictício
                    UserModel user = UserModel(
                      id: 0, // O ID será ajustado automaticamente pela função
                      name: 'Kannon',
                      email: 'kannon@gmail.com',
                      password: '123',
                      teams: [
                        PokemonTeamModel(
                          'Time Poderoso',
                          PokemonModel(
                            name: 'Greninja',
                            lvl: 50,
                            nature: 'Timid',
                            ability: 'Protean',
                            hp: 72,
                            atk: 95,
                            def: 67,
                            spa: 103,
                            spd: 71,
                            spe: 122,
                            image:
                                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/658.png',
                            move1: 'Hydro Pump',
                            move2: 'Ice Beam',
                            move3: 'Dark Pulse',
                            move4: 'Extrasensory',
                          ),
                          PokemonModel(
                            name: 'Archalodon',
                            lvl: 50,
                            nature: 'Adamant',
                            ability: 'Steelworker',
                            hp: 95,
                            atk: 145,
                            def: 85,
                            spa: 60,
                            spd: 75,
                            spe: 55,
                            image:
                                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1018.png',
                            move1: 'Heavy Slam',
                            move2: 'Earthquake',
                            move3: 'Stealth Rock',
                            move4: 'Stone Edge',
                          ),
                          PokemonModel(
                            name: 'Meowscarada',
                            lvl: 50,
                            nature: 'Jolly',
                            ability: 'Overgrow',
                            hp: 76,
                            atk: 110,
                            def: 70,
                            spa: 81,
                            spd: 70,
                            spe: 123,
                            image:
                                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/908.png',
                            move1: 'Flower Trick',
                            move2: 'Knock Off',
                            move3: 'Play Rough',
                            move4: 'U-turn',
                          ),
                          PokemonModel(
                            name: 'Blaziken',
                            lvl: 50,
                            nature: 'Jolly',
                            ability: 'Speed Boost',
                            hp: 80,
                            atk: 120,
                            def: 70,
                            spa: 110,
                            spd: 70,
                            spe: 80,
                            image:
                                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/257.png',
                            move1: 'Flare Blitz',
                            move2: 'High Jump Kick',
                            move3: 'Protect',
                            move4: 'Swords Dance',
                          ),
                          PokemonModel(
                            name: 'Ceruledge',
                            lvl: 50,
                            nature: 'Adamant',
                            ability: 'Flash Fire',
                            hp: 75,
                            atk: 125,
                            def: 80,
                            spa: 60,
                            spd: 100,
                            spe: 85,
                            image:
                                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/937.png',
                            move1: 'Bitter Blade',
                            move2: 'Shadow Sneak',
                            move3: 'Close Combat',
                            move4: 'Swords Dance',
                          ),
                          PokemonModel(
                            name: 'Armarouge',
                            lvl: 50,
                            nature: 'Modest',
                            ability: 'Flash Fire',
                            hp: 85,
                            atk: 60,
                            def: 100,
                            spa: 125,
                            spd: 80,
                            spe: 75,
                            image:
                                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/936.png',
                            move1: 'Expanding Force',
                            move2: 'Armor Cannon',
                            move3: 'Aura Sphere',
                            move4: 'Protect',
                          ),
                        ),
                        PokemonTeamModel(
                          'Time Espers',
                          PokemonModel(
                            name: 'Lucario',
                            lvl: 50,
                            nature: 'Jolly',
                            ability: 'Steadfast',
                            hp: 70,
                            atk: 110,
                            def: 70,
                            spa: 115,
                            spd: 70,
                            spe: 90,
                            image:
                                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/448.png',
                            move1: 'Close Combat',
                            move2: 'Aura Sphere',
                            move3: 'Extreme Speed',
                            move4: 'Iron Tail',
                          ),
                          PokemonModel(
                            name: 'Sceptile',
                            lvl: 50,
                            nature: 'Timid',
                            ability: 'Overgrow',
                            hp: 70,
                            atk: 85,
                            def: 65,
                            spa: 105,
                            spd: 65,
                            spe: 120,
                            image:
                                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/254.png',
                            move1: 'Leaf Blade',
                            move2: 'Dragon Claw',
                            move3: 'Focus Blast',
                            move4: 'Earthquake',
                          ),
                          PokemonModel(
                            name: 'Charizard',
                            lvl: 50,
                            nature: 'Modest',
                            ability: 'Blaze',
                            hp: 78,
                            atk: 84,
                            def: 78,
                            spa: 109,
                            spd: 85,
                            spe: 100,
                            image:
                                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png',
                            move1: 'Flamethrower',
                            move2: 'Air Slash',
                            move3: 'Dragon Pulse',
                            move4: 'Earthquake',
                          ),
                          PokemonModel(
                            name: 'Blastoise',
                            lvl: 50,
                            nature: 'Bold',
                            ability: 'Torrent',
                            hp: 79,
                            atk: 83,
                            def: 100,
                            spa: 85,
                            spd: 105,
                            spe: 78,
                            image:
                                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/9.png',
                            move1: 'Hydro Pump',
                            move2: 'Ice Beam',
                            move3: 'Rapid Spin',
                            move4: 'Protect',
                          ),
                          PokemonModel(
                            name: 'Umbreon',
                            lvl: 50,
                            nature: 'Calm',
                            ability: 'Synchronize',
                            hp: 95,
                            atk: 65,
                            def: 110,
                            spa: 60,
                            spd: 130,
                            spe: 65,
                            image:
                                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/197.png',
                            move1: 'Foul Play',
                            move2: 'Toxic',
                            move3: 'Wish',
                            move4: 'Protect',
                          ),
                          PokemonModel(
                            name: 'Espeon',
                            lvl: 50,
                            nature: 'Timid',
                            ability: 'Synchronize',
                            hp: 65,
                            atk: 65,
                            def: 60,
                            spa: 130,
                            spd: 95,
                            spe: 110,
                            image:
                                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/196.png',
                            move1: 'Psychic',
                            move2: 'Shadow Ball',
                            move3: 'Dazzling Gleam',
                            move4: 'Calm Mind',
                          ),
                        )
                      ],
                    );

                    // Chama a função para salvar o usuário se o localStorage estiver vazio
                    await jsonSave.saveIfEmpty(user, 'users_data', context);
                    jsonSave.printLocalStorage('users_data');
                  },
                  child: Container(
                    width: 200,
                    height: 200,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
              ),
              Container(
                height: 20,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 20, bottom: 12),
                  child: Column(
                    children: [
                      TextField(
                        onChanged: (text) {
                          username = text;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'USERNAME',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (text) {
                          password = text;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ButtonLoginPage(
                          text: 'Entrar',
                          funct: () => loginPageController.login(
                              username, password, context)),
                      SizedBox(
                        height: 15,
                      ),
                      ButtonLoginPage(
                          text: 'Registrar',
                          funct: () => loginPageController.register(context))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child:
                Image.asset('assets/images/background.jpg', fit: BoxFit.cover)),
        Container(
          color: Colors.black.withOpacity(0.1),
        ),
        _body(),
      ],
    ));
  }
}
