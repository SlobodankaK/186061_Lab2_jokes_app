import 'package:flutter/material.dart';
import 'package:lab2_186061/services/api_services.dart';
import 'package:lab2_186061/models/joke.dart';

class RandomJokeScreen extends StatefulWidget {
  @override
  _RandomJokeScreenState createState() => _RandomJokeScreenState();
}

class _RandomJokeScreenState extends State<RandomJokeScreen> {
  late Future<Joke> _randomJoke;

  @override
  void initState() {
    super.initState();
    _randomJoke = ApiServices().getRandomJoke();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Random Joke')),
      body: FutureBuilder<Joke>(
        future: _randomJoke,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No random joke available'));
          }

          final joke = snapshot.data!;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(joke.setup, style: TextStyle(fontSize: 22)),
                SizedBox(height: 10),
                Text(joke.punchline, style: TextStyle(fontSize: 18)),
              ],
            ),
          );
        },
      ),
    );
  }
}
