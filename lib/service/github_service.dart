import 'dart:convert';

import 'package:flutter_application_1/models/github_model.dart';
import 'package:http/http.dart' as http;

class GithubService {
  static const baseURL = "https://api.github.com/users";

  static Future<GitHub> getUser(String userName) async {
    final response = await http.get(Uri.parse('$baseURL/$userName'));

    if (response.statusCode == 200) {
      return GitHub.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Github user data');
    }
  }
}