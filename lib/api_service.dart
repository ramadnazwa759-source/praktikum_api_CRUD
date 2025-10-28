import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user_model.dart';
import 'api_config.dart'; 

class ApiService {
  static const String baseUrl = 'https://reqres.in/api';

  // READ (GET): Mengambil daftar pengguna
  Future<List<User>> fetchUsers() async {
    final response = await http.get(
      Uri.parse('$baseUrl/users?page=2'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-api-key': ApiConfig.apiKey, // Contoh: jika API key dikirim di header
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> userListJson = data['data'];
      return userListJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat pengguna: Status ${response.statusCode}, Body: ${response.body}');
    }
  }

  // CREATE (POST): Membuat user baru
  Future<Map<String, dynamic>> createUser(String name, String job) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-api-key': ApiConfig.apiKey, // Kirim API key di header
      },
      body: jsonEncode({'name': name, 'job': job}),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Gagal membuat user: Status ${response.statusCode}, Body: ${response.body}');
    }
  }

  // UPDATE (PUT): Memperbarui user
  Future<Map<String, dynamic>> updateUser(String id, String name, String job) async {
    final response = await http.put(
      Uri.parse('$baseUrl/users/$id'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-api-key': ApiConfig.apiKey, // Kirim API key di header
      },
      body: jsonEncode({'name': name, 'job': job}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Gagal memperbarui user: Status ${response.statusCode}, Body: ${response.body}');
    }
  }

  // DELETE: Menghapus user
  Future<void> deleteUser(String id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/users/$id'),
      headers: {
        'x-api-key': ApiConfig.apiKey, // Kirim API key di header
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Gagal menghapus user: Status ${response.statusCode}, Body: ${response.body}');
    }
  }
}