import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';
import '../widgets/letter_tile.dart';
import '../widgets/word_display.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Jogo de Formação de Palavras'),
        ),
        body: Consumer<GameProvider>(
          builder: (context, gameProvider, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                WordDisplay(currentGuess: gameProvider.currentGuess),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 10,
                  children: gameProvider.currentGuess
                      .split('')
                      .asMap()
                      .entries
                      .map((entry) => LetterTile(
                    letter: entry.value,
                    index: entry.key,
                  ))
                      .toList(),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const Text('Verificar'),
                  onPressed: () {
                    if (gameProvider.checkGuess()) {
                      // Mostrar mensagem de sucesso
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Parabéns!'),
                          content: const Text('Você formou a palavra correta!'),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                                gameProvider.shuffleWord();
                              },
                            ),
                          ],
                        ),
                      );
                    } else {
                      // Mostrar mensagem de erro
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Tente novamente'),
                          content: const Text('A palavra está incorreta.'),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
