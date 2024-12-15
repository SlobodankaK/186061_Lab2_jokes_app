import 'package:flutter/material.dart';
import 'package:lab2_186061/models/joke.dart';
import 'package:lab2_186061/services/api-services.dart';
import 'package:lab2_186061/widgets/joke_card.dart';

class JokesByTypeScreen extends StatefulWidget {
  final String jokeType;

  JokesByTypeScreen({required this.jokeType});

  @override
  _JokesByTypeScreenState createState() => _JokesByTypeScreenState();
}

class _JokesByTypeScreenState extends State<JokesByTypeScreen> {
  late Future<List<Joke>> _jokes;

  @override
  void initState() {
    super.initState();
    _jokes = ApiServices().getJokesByType(widget.jokeType);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.jokeType)),
      body: FutureBuilder<List<Joke>>(
        future: _jokes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No jokes available'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final joke = snapshot.data![index];
              return JokeCard(
                jokeType: widget.jokeType,
                onTap: () {
                },
                joke: joke,
              );
            },
          );
        },
      ),
    );
  }
}
