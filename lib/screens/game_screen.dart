import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Forme a Palavra'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Pontuação\n',
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                  children: <TextSpan>[
                    TextSpan(
                      text: gameProvider.score.toString(),
                      style: const TextStyle(
                          color: Colors.blueAccent, fontSize: 24, height: 1.8, fontWeight: FontWeight.w600),
                    )
                  ]),
            ),
            const Text(
              'Arraste as letras para formar a palavra correta:',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: gameProvider.currentGuess
                  .split('')
                  .asMap()
                  .entries
                  .map((entry) {
                int index = entry.key;
                String letter = entry.value;
                return Draggable<int>(
                  data: index,
                  feedback: Material(
                    color: Colors.transparent,
                    child: Text(
                      letter,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  childWhenDragging: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      letter,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  child: DragTarget<int>(
                    builder: (BuildContext context, List<dynamic> accepted,
                        List<dynamic> rejected) {
                      return Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        child: Text(
                          letter,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
                    onAccept: (int data) {
                      gameProvider.swapLetters(data, index);
                    },
                  ),
                );
              }).toList(),
            ),
            Text(gameProvider.currentWord.category[0].toUpperCase() +
                gameProvider.currentWord.category.substring(1)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (gameProvider.checkGuess()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Correto!')),
                  );
                  gameProvider.shuffleWord();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Tente novamente!')),
                  );
                }
              },
              child: const Text('Verificar'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
