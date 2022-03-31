import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/Vacations.dart';

class VacationsServices {
  static const String _baseUrl = 'http://127.0.0.1:8000/api/';

  Future<Vacations> getAllVacations() async {
    final response = await http.get(Uri.parse(_baseUrl + "vacations"));
    if (response.statusCode == 200) {
      return Vacations.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<bool> createVacation(Map<String, dynamic> body) async {
    final response =
        await http.post(Uri.parse(_baseUrl + "vacations"), body: body);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteVacation(int id) async {
    final response =
        await http.delete(Uri.parse(_baseUrl + "vacations/" + id.toString()));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateVacation(Map<String, dynamic> body, int id) async {
    final response = await http
        .put(Uri.parse(_baseUrl + "vacations/" + id.toString()), body: body);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
