import 'dart:convert';

import 'package:http/http.dart' as http;

class Apiprovider {
  Future<http.Response> homedata() async {
    final response = await http.get(
      Uri.parse("https://www.omdbapi.com/?s=war&apikey=f8484760"),
      headers: {'Content-Type': 'application/json'},
    );
    return response;
  }
}
