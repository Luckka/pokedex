import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex/modules/home/models/poke_model.dart';
class HomeRepository {
  final Dio _dio;

  HomeRepository(this._dio);

  Future<Pokedex> getData() async{
    try{
      var response = await _dio.get(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
      return Pokedex.fromJson(json.decode(response.data));
    


    }catch(e) {
      print(e);
      rethrow;
    }
  }
}