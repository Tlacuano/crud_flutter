import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crud_flutter/data/model/Barca.dart';

class BarcaRepository {
  final String apiUrl;

  BarcaRepository({required this.apiUrl});

  Future<void> createBarca(BarcaModel barca) async {
    final response = await http.post(
      Uri.parse('$apiUrl/register_barca/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer token',
      },
      body: jsonEncode(barca.toJson()..remove('id')),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to create barca');
    }
  }

  Future<void> updateBarca(BarcaModel barca) async {
    final response = await http.post(
      Uri.parse('$apiUrl/update_barca/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        //'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(barca.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update barca');
    }
  }

  Future<void> deleteBarca(BarcaModel barca) async {
    final response = await http.post(
      Uri.parse('$apiUrl/delete_barca/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        //'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(barca.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete barca');
    }
  }

  Future<List<BarcaModel>> getBarcas() async {
    final response = await http.get(
      Uri.parse('$apiUrl/get_barcas/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        //'Authorization': 'Bearer token',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<BarcaModel> barcas =
          body.map((dynamic item) => BarcaModel.fromJson(item)).toList();
      return barcas;
    } else {
      throw Exception('Failed to load barcas');
    }
  }
}
