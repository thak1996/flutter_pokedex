import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_pokedex/common/consts/api_consts.dart';
import 'package:flutter_pokedex/common/error/failure.dart';
import 'package:flutter_pokedex/common/models/pokemon.dart';

abstract class IPokemonRepository {
  Future<List<Pokemon>> getAllPokemons();
}

class PokemonRepository implements IPokemonRepository {
  PokemonRepository({required this.dio});
  final Dio dio;

  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final response = await dio.get(ApiConsts.allPokemonsURL);
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final list = json['pokemon'] as List<dynamic>;
      return list.map((e) => Pokemon.fromMap(e)).toList();
    } catch (e) {
      throw Failure(message: 'Não foi possível carregar os dados');
    }
  }
}
