import 'package:lrn_cubt/data/models/characters.dart';
import 'package:lrn_cubt/data/web_services/character_web_services.dart';

class CharactersRepo {
  final CharacterWebServices characterWebServices;

  CharactersRepo(this.characterWebServices);
  Future<List<Character>> getAllCharacters() async {
    final characters = await characterWebServices.getAllCharacters();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
