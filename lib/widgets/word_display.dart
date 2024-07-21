import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';

class WordDisplay extends StatelessWidget {
  final String currentGuess;

  const WordDisplay({super.key, required this.currentGuess});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: currentGuess.split('').asMap().entries.map((entry) {
        return DragTarget<int>(
          builder: (context, candidateData, rejectedData) {
            return Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              color: Colors.white,
              child: Text(
                entry.value,
                style: const TextStyle(fontSize: 24, color: Colors.black),
              ),
            );
          },
          onAcceptWithDetails: (receivedIndex) {
            Provider.of<GameProvider>(context, listen: false).swapLetters(
              entry.key,
              receivedIndex as int,
            );
          },
        );
      }).toList(),
    );
  }
}
