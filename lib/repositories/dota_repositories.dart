import 'dart:convert';

// import 'package:hore_list/models/hero_model.dart';
import 'package:hore_list/models/hero_status_model.dart';
import 'package:hore_list/services/hero_dota_service.dart';

class GetHeroRepository {
  final _client = HeroDataService();

  Future<List<HeroStatusModel>> fetchHeroList() async {
    List<HeroStatusModel> list = <HeroStatusModel>[];
    // final response = await _client.get('heroes');
    final response = await _client.get('heroStats');
    List<dynamic> heroDota = await json.decode(response);
    list = heroDota.map((herose) => HeroStatusModel.fromJson(herose)).toList();

    return list;
  }
}
