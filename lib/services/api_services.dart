import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lab2_186061/models/joke.dart';

class ApiServices {
  static const baseUrl = 'https://official-joke-api.appspot.com';

  Future<List<String>> getJokeTypes() async {
    final response = await http.get(Uri.parse('$baseUrl/types'));

    if (response.statusCode == 200) {
      return List<String>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load joke types');
    }
  }

  Future<List<Joke>> getJokesByType(String type) async {
    final response = await http.get(Uri.parse('$baseUrl/jokes/$type/ten'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((joke) => Joke.fromJson(joke)).toList();
    } else {
      throw Exception('Failed to load jokes');
    }
  }

  Future<Joke> getRandomJoke() async {
    final response = await http.get(Uri.parse('$baseUrl/random_joke'));

    if (response.statusCode == 200) {
      return Joke.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load random joke');
    }
  }
}
