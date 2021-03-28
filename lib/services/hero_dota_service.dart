import 'dart:developer';

import 'package:http/http.dart' as http;

class HeroDataService {
  String _host = "api.opendota.com";
  String _subHost = "api";

  Future<dynamic> get(String path) async {
    Uri uri = Uri.https(_host, '/$_subHost/$path');
    log(uri.toString());

    final response = await http.get(uri);

    switch (response.statusCode) {
      case 200:
        print(response.body.toString());
        break;
      case 404:
        throw Exception('Failed to load Heroes');
        break;
      default:
    }

    return response.body;
  }
}
