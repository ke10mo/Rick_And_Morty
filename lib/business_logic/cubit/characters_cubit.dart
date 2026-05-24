import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lrn_cubt/data/models/characters.dart';
import 'package:lrn_cubt/data/repos/characters_repo.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepo charactersRepo;
  List<Character> characters = [];
  CharactersCubit(this.charactersRepo) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    charactersRepo
        .getAllCharacters()
        .then((characters) {
          emit(CharactersLoading(characters));
          this.characters = characters;
        })
        .catchError((error) {
          emit(CharactersInitial());
        });
    return characters;
  }
}
