import 'package:flutter/material.dart';
import 'screens/home_screen.dart' as home_screen;
import 'screens/jokes_by_type_screen.dart' as jokes_screen; 
import 'screens/random_joke_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joke App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) =>home_screen.HomeScreen(), 
        '/jokes': (context) => jokes_screen.JokesByTypeScreen(
            jokeType: ModalRoute.of(context)!.settings.arguments as String),
        '/random': (context) => RandomJokeScreen(),
      },
    );
  }
}