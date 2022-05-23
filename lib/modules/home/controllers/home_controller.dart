import 'package:pokedex/modules/home/models/poke_model.dart';
import 'package:pokedex/modules/home/repositories/home_repository.dart';

import '../../../shared/core/app_palette.dart';

class HomeController{
  final HomeRepository _homeRepository;

  HomeController(this._homeRepository);

  Future<Pokedex> getPokemonsList() async {
    try{
      var result = await _homeRepository.getData();
      return result;

    }catch(e){
      print(e);
      rethrow;
    }
  }

  backgroundColor(String type) {
    switch (type) {
      case 'Bug':
        return AppPalette.greenDark;
      case 'Dragon':
        return AppPalette.redDark;
      case 'Electric':
        return AppPalette.yellow;
      case 'Fighting':
        return AppPalette.orange;
      case 'Fire':
        return AppPalette.red;
      case 'Ghost':
        return AppPalette.pink;
      case 'Grass':
        return AppPalette.green;
      case 'Ground':
        return AppPalette.brown;
      case 'Ice':
        return AppPalette.ice;
      case 'Normal':
        return AppPalette.grey;
      case 'Poison':
        return AppPalette.purple;
      case 'Psychic':
        return AppPalette.blueDark;
      case 'Rock':
        return AppPalette.greyDark;
      case 'Water':
        return AppPalette.blue;
      default:
        return AppPalette.grey;
    }
  }
}                           