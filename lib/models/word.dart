class Word {
  final String original;
  final String category;

  Word(this.original, this.category);

  String get shuffled {
    List<String> chars = original.split('');
    chars.shuffle();
    return chars.join('');
  }
}
