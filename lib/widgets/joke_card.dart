import 'package:flutter/material.dart';
import 'package:lab2_186061/models/joke.dart';
import '../services/favorite_service.dart';
import '../models/favorite_joke.dart';
class JokeCard extends StatelessWidget {
  final Joke? joke;
  final VoidCallback onTap;

  const JokeCard({required this.joke, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Text(joke?.setup ?? 'No joke available'), 
        subtitle: Text(joke?.punchline ?? ''), 
        trailing: joke == null 
            ? null 
            : IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () async {
                  if (joke != null) {
                    await FavoriteService.saveFavoriteJoke(FavoriteJoke(
                      setup: joke!.setup,
                      punchline: joke!.punchline,
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Added joke to favorites!')),
                    );
                  }
                },
              ),
        onTap: onTap,
      ),
    );
  }
}