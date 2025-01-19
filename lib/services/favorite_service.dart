import 'package:shared_preferences/shared_preferences.dart';
import '../models/favorite_joke.dart';

class FavoriteService {
  static Future<void> saveFavoriteJoke(FavoriteJoke joke) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteJokes = prefs.getStringList('favoriteJokes') ?? [];

    favoriteJokes.add(joke.setup + '::' + joke.punchline);
    await prefs.setStringList('favoriteJokes', favoriteJokes);
  }

  static Future<List<FavoriteJoke>> getFavoriteJokes() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteJokes = prefs.getStringList('favoriteJokes') ?? [];
    return favoriteJokes
        .map((joke) {
          final parts = joke.split('::');
          return FavoriteJoke(setup: parts[0], punchline: parts[1]);
        })
        .toList();
  }
}