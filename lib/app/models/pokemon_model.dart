class PokemonModel {

  //base
  final String name;
  final int lvl;
  final String nature;
  final String ability;
  final String image;

  //status
  final int hp;
  final int atk;
  final int def;
  final int spa;
  final int spd;
  final int spe;

  //moveset
  final String move1;
  final String move2;
  final String move3;
  final String move4;


  PokemonModel(this.move1, this.move2, this.move3, this.move4, {required this.name, required this.lvl, required this.nature, required this.ability, required this.hp, required this.atk, required this.def, required this.spa, required this.spd, required this.spe, required this.image});
}