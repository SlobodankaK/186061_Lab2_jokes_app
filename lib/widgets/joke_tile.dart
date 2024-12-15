import 'package:flutter/material.dart';
import 'package:lab2_186061/models/joke.dart';

class JokeTile extends StatelessWidget {
  final Joke joke;

  const JokeTile({required this.joke, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              joke.setup,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              joke.punchline,
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
