// apiservice/apiservice.dart
import 'dart:io';

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

// Upload image and get prediction
  static Future<Map<String, dynamic>?> predictImage(File imageFile) async {
    final url = Uri.parse('$baseUrl/predict/predict/');
    
    try {
      // Creating a multipart request
      var request = http.MultipartRequest('POST', url)
        ..files.add(await http.MultipartFile.fromPath('file', imageFile.path)); // Ensure 'file' is the correct field name

      // Sending the request
      var response = await request.send();
      
      // Check for a successful response
      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        return jsonDecode(responseData); // Decode the JSON response
      } else {
        // Handle error responses
        print("Error: ${response.statusCode} ${response.reasonPhrase}");
        final responseBody = await response.stream.bytesToString();
        print("Response Body: $responseBody");
        return null;
      }
    } catch (e) {
      // Catch and print any errors
      print("Error: $e");
      return null;
    }
  }

static Future<bool> sendPredictionDetails(Map<String, dynamic> predictionData) async {
  final url = Uri.parse('$baseUrl/details/details/predictions/');
  
  try {
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(predictionData),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      print("Error sending prediction: ${response.body}");
      return false;
    }
  } catch (e) {
    print("Error: $e");
    return false;
  }
}
// Fetch recent predictions for a user by user_id
 static Future<List<Map<String, dynamic>>?> fetchRecentPredictions(int userId) async {
  final url = Uri.parse('$baseUrl/details/predictions/userrecent/$userId?limit=5'); // Ensure the limit is passed
  
  try {
    final response = await http.get(url);
    
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => item as Map<String, dynamic>).toList();
    } else {
      print("Error: ${response.body}");
      return null;
    }
  } catch (e) {
    print("Error: $e");
    return null;
  }
}

  // Fetch user predictions
  static Future<List<Map<String, dynamic>>?> fetchUserPredictions(int userId) async {
    final url = Uri.parse('$baseUrl/details/predictions/user/$userId');

    try {
      // Make HTTP GET request
      final response = await http.get(url);

      // Check if the request was successful
      if (response.statusCode == 200) {
        // Decode the response body to a List<dynamic>
        final List<dynamic> data = jsonDecode(response.body);

        // Ensure the response data is a list of maps
        // Cast each item in the list to Map<String, dynamic>
        return data.map((item) {
          if (item is Map<String, dynamic>) {
            return item;
          } else {
            print("Warning: Unexpected data format");
            return <String, dynamic>{};  // Return an empty map if the format is unexpected
          }
        }).toList();
      } else {
        print("Error fetching user predictions: ${response.statusCode} ${response.body}");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

static Future<bool> submitTicket({
  required int userId,
  required String name,
  required String email,
  required String subject,
  required String description,
  String? attachmentUrl, // This will be the file URL if the file is uploaded
}) async {
  try {
    // Replace 'YOUR_API_ENDPOINT' with the actual endpoint for your ticket submission
    final Uri url = Uri.parse('http://10.0.2.2:8000/ticket/tickets/');

    // Make the POST request to the API
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer ${globals.accessToken}', // Ensure the token is passed
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'user_id': userId, // Changed from 'userId' to 'user_id'
        'name': name,
        'email': email,
        'subject': subject,
        'description': description,
        'attachment': attachmentUrl ?? '', // Pass the URL or empty string if no attachment
      }),
    );

    // Check the response status code
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true; // Success
    } else {
      // Log the error response body for debugging
      print('Failed to submit ticket: ${response.body}');
      return false;
    }
  } catch (e) {
    // Catch any errors and log them
    print('Error submitting ticket: $e');
    return false;
  }
}
 
}