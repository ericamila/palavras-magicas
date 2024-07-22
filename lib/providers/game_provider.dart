import 'package:flutter/material.dart';
import '../models/word.dart';

class GameProvider with ChangeNotifier {
  final List<Word> _words = [
    Word('MAÇA', 'frutas'),
    Word('BANANA', 'frutas'),
    Word('UVA', 'frutas'),
    Word('LARANJA', 'frutas'),
    Word('MORANGO', 'frutas'),
    Word('CACHORRO', 'animais'),
    Word('GATO', 'animais'),
    Word('PÁSSARO', 'animais'),
    Word('CARRO', 'transportes'),
    Word('BICICLETA', 'transportes'),
    Word('ÔNIBUS', 'transportes'),
    Word('CALÇA', 'roupas'),
    Word('BLUSA', 'roupas'),
    Word('JAQUETA', 'roupas'),
    // Adicione mais palavras aqui
  ];

  List<String> _selectedCategories = [];
  late List<Word> _filteredWords;
  late Word _currentWord;
  late List<String> _currentGuess;
  int _score = 0;

  GameProvider() {
    _filteredWords = _words; // Inicializar com todas as palavras
    _setNewWord();
  }

  Word get currentWord => _currentWord;
  String get currentGuess => _currentGuess.join('');
  int get score => _score;

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
        : Word('Palavras não disponíveis!', '');
    _currentGuess = _currentWord.shuffled.split('');
  }

/*  void _setNewWord() {
    if (_filteredWords.isNotEmpty) {
      _currentWord = _filteredWords[0];
      _currentGuess = _currentWord.shuffled.split('');
    } else {
      _currentWord = Word('Palavras não disponíveis!', '');
      _currentGuess = [];
    }
    notifyListeners();
  }*/

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
    if (currentGuess == _currentWord.original) {
      _score += 10;
      notifyListeners();
      return true;
    } else {
      _score -= 5;
      notifyListeners();
      return false;
    }
  }

}
