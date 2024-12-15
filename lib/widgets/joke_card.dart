import 'package:flutter/material.dart';
import 'package:lab2_186061/models/joke.dart';

class JokeCard extends StatelessWidget {
  final String jokeType;
  final Joke? joke;
  final void Function() onTap;

  JokeCard({
    required this.jokeType,
    required this.onTap,
    this.joke,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(joke != null ? joke!.setup : jokeType),
        subtitle: joke != null ? Text(joke!.punchline) : null,
        onTap: onTap,
      ),
    );
  }
}
