import 'package:flutter/material.dart';
import '../models/word.dart';

class GameProvider with ChangeNotifier {
  final List<Word> _words = [
    Word('apple', 'frutas'),
    Word('banana', 'frutas'),
    Word('grape', 'frutas'),
    Word('orange', 'frutas'),
    Word('mango', 'frutas'),
    Word('dog', 'animais'),
    Word('cat', 'animais'),
    Word('bird', 'animais'),
    Word('car', 'transportes'),
    Word('bike', 'transportes'),
    Word('bus', 'transportes'),
    Word('shirt', 'roupas'),
    Word('pants', 'roupas'),
    Word('jacket', 'roupas'),
    // Adicione mais palavras aqui
  ];

  List<String> _selectedCategories = [];
  late List<Word> _filteredWords;
  late Word _currentWord;
  late List<String> _currentGuess;

  GameProvider() {
    _filteredWords = _words; // Inicializar com todas as palavras
    _setNewWord();
  }

  Word get currentWord => _currentWord;
  String get currentGuess => _currentGuess.join('');

  void updateCategories(List<String> categories) {
    _selectedCategories = categories;
    _filteredWords = _words
        .where((word) => _selectedCategories.contains(word.category))
        .toList();
    _setNewWord();
    notifyListeners();
  }

  void _setNewWord() {
    _currentWord = _filteredWords.isNotEmpty
        ? _filteredWords[0]
        : Word('No words available', '');
    _currentGuess = _currentWord.shuffled.split('');
  }

  void shuffleWord() {
    if (_filteredWords.isEmpty) return;
    int currentIndex = _filteredWords.indexOf(_currentWord);
    _currentWord = _filteredWords[(currentIndex + 1) % _filteredWords.length];
    _currentGuess = _currentWord.shuffled.split('');
    notifyListeners();
  }

  void swapLetters(int fromIndex, int toIndex) {
    final temp = _currentGuess[fromIndex];
    _currentGuess[fromIndex] = _currentGuess[toIndex];
    _currentGuess[toIndex] = temp;
    notifyListeners();
  }

  bool checkGuess() {
    return currentGuess == _currentWord.original;
  }
}
