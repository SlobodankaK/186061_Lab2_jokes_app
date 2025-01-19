class FavoriteJoke {
  final String setup;
  final String punchline;

  FavoriteJoke({required this.setup, required this.punchline});

  Map<String, dynamic> toMap() {
    return {
      'setup': setup,
      'punchline': punchline,
    };
  }

  static FavoriteJoke fromMap(Map<String, dynamic> map) {
    return FavoriteJoke(
      setup: map['setup'],
      punchline: map['punchline'],
    );
  }
}
