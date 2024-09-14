import 'package:flutter/material.dart';

class TeamBox extends StatelessWidget {
  final dynamic teamData; // Recebe os dados do time

  const TeamBox({super.key, required this.teamData});

  @override
  Widget build(BuildContext context) {
    // Exemplo de como você pode usar `teamData`
    // Atualize isso conforme a estrutura real dos seus dados
    return Card(
      color: Color.fromARGB(255, 175, 175, 175),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width - 70,
          height: MediaQuery.of(context).size.height / 8,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Expanded(flex: 9, child: Text('${teamData['team_name'] ?? 'Unknown'}')),
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
                    if(teamData['pokemon1']['name'] != '')
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.asset(
                                'assets/images/pokeball.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned.fill(
                              child: Image.network(
                                '${teamData['pokemon1']['image']}' ?? 'https://example.com/default.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if(teamData['pokemon2']['name'] != '')
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.asset(
                                'assets/images/pokeball.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned.fill(
                              child: Image.network(
                                '${teamData['pokemon2']['image']}' ?? 'https://example.com/default.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if(teamData['pokemon3']['name'] != '')
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.asset(
                                'assets/images/pokeball.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned.fill(
                              child: Image.network(
                                '${teamData['pokemon3']['image']}' ?? 'https://example.com/default.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if(teamData['pokemon4']['name'] != '')
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.asset(
                                'assets/images/pokeball.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned.fill(
                              child: Image.network(
                                '${teamData['pokemon4']['image']}' ?? 'https://example.com/default.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if(teamData['pokemon5']['name'] != '')
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.asset(
                                'assets/images/pokeball.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned.fill(
                              child: Image.network(
                                '${teamData['pokemon5']['image']}' ?? 'https://example.com/default.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if(teamData['pokemon6']['name'] != '')
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.asset(
                                'assets/images/pokeball.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned.fill(
                              child: Image.network(
                                '${teamData['pokemon6']['image']}' ?? 'https://example.com/default.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
