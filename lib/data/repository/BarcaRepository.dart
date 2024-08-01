import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crud_flutter/data/model/Barca.dart';

class BarcaRepository {
  final String apiUrl;
  final String accessToken;

  BarcaRepository({required this.apiUrl, required this.accessToken});

  Future<void> createBarca(BarcaModel barca) async {
    final response = await http.post(
      Uri.parse('$apiUrl/create-barca'),
      headers: {
        'Content-Type': 'application/json ; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(barca.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create barca');
    }
  }

  Future<BarcaModel> getBarca(int id) async {
    final response = await http.get(
      Uri.parse('$apiUrl/get-barca/$id'),
      headers: {
        'Content-Type': 'application/json ; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      return BarcaModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load barca');
    }
  }

  Future<void> updateBarca(BarcaModel barca) async {
    final response = await http.post(
      Uri.parse('$apiUrl/update-barca'),
      headers: {
        'Content-Type': 'application/json ; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(barca.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update barca');
    }
  }

  Future<void> deleteBarca(int id) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/delete-barca/$id'),
      headers: {
        'Content-Type': 'application/json ; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete barca');
    }
  }

  Future<List<BarcaModel>> getBarcas() async {
    final response = await http.get(
      Uri.parse('$apiUrl/get-barcas'),
      headers: {
        'Content-Type': 'application/json ; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
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
