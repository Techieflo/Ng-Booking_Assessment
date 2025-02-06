import 'package:assessment/models/dashboard_modal.dart';
import 'package:assessment/models/email_request_modal.dart';
import 'package:assessment/models/login.dart';
import 'package:assessment/models/register.dart';
import 'package:assessment/models/registration%20error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static String baseUrl = dotenv.get("baseurl", fallback: "");
  static String base_Url = dotenv.get("base_url", fallback: "");

  Future<RegisterResponse> register(RegisterRequest request) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: request.toJson(),
    );

    if (response.statusCode == 200) {
      return RegisterResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to register');
    }
  }

  Future<LoginResponse> login(LoginRequest request) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: request.toJson(),
    );

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else {
      // Parse the error message from the response
      final errorResponse = jsonDecode(response.body);
      // _showErrorDialog(errorResponse);
      print(errorResponse['message']);
      throw Exception(errorResponse['message'] ?? 'Failed to login');
    }
  }

  Future<EmailResponse> sendEmailVerification(String email) async {
    final request = EmailRequest(email);
    final response = await http.post(
      Uri.parse('$baseUrl/email'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      print(response.body);
      return EmailResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          'Failed to send email verification: ${response.statusCode}');
    }
  }

  Future<String> verifyEmail(String email, String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/email/verify'),
      headers: {'Accept': 'application/json'},
      body: {'email': email, 'token': token},
    );

    if (response.statusCode == 200) {
      return "Verification successful!";
    } else {
      final responseData = json.decode(response.body);
      return "Verification failed: ${responseData['message']}";
    }
  }

  Future<String> registerUser(Map<String, String> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Accept': 'application/json'},
      body: data,
    );

    if (response.statusCode == 200) {
      return "Registration successful!";
    } else {
      final responseData = json.decode(response.body);
      final errorResponse = RegistrationError.fromJson(responseData);
      print("Error message: ${errorResponse.message}");
      print("Email error: ${errorResponse.getEmailErrorMessage()}");
      return errorResponse.getEmailErrorMessage();
    }
  }

  Future<DashboardResponse> getDashboardData(String? token) async {
    final response = await http.get(
      Uri.parse('$base_Url/dashboard'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      return DashboardResponse.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load dashboard data');
    }
  }
}
