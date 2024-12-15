class Joke {
  final String setup;
  final String punchline;

  Joke({required this.setup, required this.punchline});

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      setup: json['setup'],
      punchline: json['punchline'],
    );
  }
}

class JokeType {
  final String type;

  JokeType({required this.type});

  factory JokeType.fromJson(Map<String, dynamic> json) {
    return JokeType(
      type: json['type'],
    );
  }
}
