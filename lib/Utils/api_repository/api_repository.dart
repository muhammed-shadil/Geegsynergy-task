import 'package:geeksynergy_mechine_task/Utils/api_provider/api_provider.dart';
import 'package:http/http.dart' as http;

class Apirepository {
  final Apiprovider apiprovider = Apiprovider();

  Future<http.Response> homedata() async {
    return apiprovider.homedata();
  }
}
