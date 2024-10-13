class PokemonModel {
  String name;
  final int lvl;
  final String nature;
  final String ability;
  final int hp;
  final int atk;
  final int def;
  final int spa;
  final int spd;
  final int spe;
  final String image;
  String move1;
  String move2;
  String move3;
  String move4;

  PokemonModel({
    required this.name,
    required this.lvl,
    required this.nature,
    required this.ability,
    required this.hp,
    required this.atk,
    required this.def,
    required this.spa,
    required this.spd,
    required this.spe,
    required this.image,
    required this.move1,
    required this.move2,
    required this.move3,
    required this.move4,
  });

  // Método toJson para serializar o Pokémon em JSON
  Map<String, dynamic> toJson() {
    return {
      'move1': move1,
      'move2': move2,
      'move3': move3,
      'move4': move4,
      'name': name,
      'lvl': lvl,
      'nature': nature,
      'ability': ability,
      'hp': hp,
      'atk': atk,
      'def': def,
      'spa': spa,
      'spd': spd,
      'spe': spe,
      'image': image,
    };
  }

  // Método fromJson para desserializar o Pokémon de JSON
  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      name: json['name'],
      lvl: json['lvl'],
      nature: json['nature'],
      ability: json['ability'],
      hp: json['hp'],
      atk: json['atk'],
      def: json['def'],
      spa: json['spa'],
      spd: json['spd'],
      spe: json['spe'],
      image: json['image'],
      move1: json['move1'],
      move2: json['move2'],
      move3: json['move3'],
      move4: json['move4'],
    );
  }
}
