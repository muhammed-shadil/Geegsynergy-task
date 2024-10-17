import 'dart:convert';

import 'package:http/http.dart' as http;

class Apiprovider {
  Future<http.Response> homedata(Map data) async {
    final response = await http.post(
      Uri.parse("http://www.omdbapi.com/?i=tt3896198&apikey=f8484760"),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );
    return response;
  }
}
