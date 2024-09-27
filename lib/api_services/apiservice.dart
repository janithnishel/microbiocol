// apiservice/apiservice.dart
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:microbiocol/global.dart' as globals;

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:8000'; // Adjust this according to your backend URL

  // Login user
  static Future<bool> loginUser(String email, String password) async {
    final url = Uri.parse('$baseUrl/auth/login');
    
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'username': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        globals.accessToken = data['access_token'];
        globals.userId = data['user_id'];
        globals.firstName = data['first_name']; // Store first name globally
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  // Register user
  static Future<bool> registerUser({
    required String email,
    required String password,
    required String firstName,
    String? lastName,
  }) async {
    final url = Uri.parse('$baseUrl/auth/register/'); // Update the endpoint accordingly

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
          'first_name': firstName,
          'last_name': lastName ?? '',
        }),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        print("Error: ${response.body}");
        return false;
      }
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }
}