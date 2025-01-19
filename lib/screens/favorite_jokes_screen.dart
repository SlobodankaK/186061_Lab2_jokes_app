import 'package:flutter/material.dart';
import '../models/favorite_joke.dart';
import '../services/favorite_service.dart';

class FavoriteJokesScreen extends StatefulWidget {
  @override
  _FavoriteJokesScreenState createState() => _FavoriteJokesScreenState();
}

class _FavoriteJokesScreenState extends State<FavoriteJokesScreen> {
  late Future<List<FavoriteJoke>> favoriteJokes;

  @override
  void initState() {
    super.initState();
    favoriteJokes = FavoriteService.getFavoriteJokes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite jokes'),
      ),
      body: FutureBuilder<List<FavoriteJoke>>(
        future: favoriteJokes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('There are no favorite jokes'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final joke = snapshot.data![index];
                return ListTile(
                  title: Text(joke.setup),
                  subtitle: Text(joke.punchline),
                );
              },
            );
          }
        },
      ),
    );
  }
}