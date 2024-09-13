import 'package:flutter/material.dart';

class TeamBox extends StatelessWidget {
  const TeamBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Color.fromARGB(255, 175, 175, 175),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(
              color: Colors.black,
              width: 1,
            )),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 70,
            height: MediaQuery.of(context).size.height / 8,
            //color: Colors.blue,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Expanded(flex: 9, child: Text('Time')),
                      Expanded(
                        flex: 1,
                        child: Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    flex: 8,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            //color: Colors.yellow,
                            width: MediaQuery.of(context).size.width / 8,
                            height: MediaQuery.of(context).size.height,
                            child: Image.network(
                                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1018.png',
                                fit: BoxFit.contain),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            //color: Colors.yellow,
                            width: MediaQuery.of(context).size.width / 8,
                            height: MediaQuery.of(context).size.height,
                            child: Image.network(
                                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/658.png',
                                fit: BoxFit.contain),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            //color: Colors.yellow,
                            width: MediaQuery.of(context).size.width / 8,
                            height: MediaQuery.of(context).size.height,
                            child: Image.network(
                                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/937.png',
                                fit: BoxFit.contain),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            //color: Colors.yellow,
                            width: MediaQuery.of(context).size.width / 8,
                            height: MediaQuery.of(context).size.height,
                            child: Image.network(
                                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/936.png',
                                fit: BoxFit.contain),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            // color: Colors.yellow,
                            width: MediaQuery.of(context).size.width / 8,
                            height: MediaQuery.of(context).size.height,
                            child: Image.network(
                                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/908.png',
                                fit: BoxFit.contain),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            //color: Colors.yellow,
                            width: MediaQuery.of(context).size.width / 8,
                            height: MediaQuery.of(context).size.height,
                            child: Image.network(
                                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/257.png',
                                fit: BoxFit.contain),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
