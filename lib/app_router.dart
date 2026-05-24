import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lrn_cubt/business_logic/cubit/characters_cubit.dart';
import 'package:lrn_cubt/constants/strings.dart';
import 'package:lrn_cubt/data/models/characters.dart';
import 'package:lrn_cubt/data/repos/characters_repo.dart';
import 'package:lrn_cubt/data/web_services/character_web_services.dart';
import 'package:lrn_cubt/presentation/screens/characters_details_screen.dart';
import 'package:lrn_cubt/presentation/screens/characters_screen.dart';

class AppRouter {
  late CharactersRepo charactersRepo;
  late CharactersCubit charactersCubit;
  AppRouter() {
    charactersRepo = CharactersRepo(CharacterWebServices());
    charactersCubit = CharactersCubit(charactersRepo);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => charactersCubit,
            child: const CharactersScreen(),
          ),
        );
      case characterDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => CharactersDetailsScreen(character: character),
        );
      default:
        return null;
    }
  }
}
