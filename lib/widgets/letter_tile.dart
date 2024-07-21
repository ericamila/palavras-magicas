import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';

class LetterTile extends StatelessWidget {
  final String letter;
  final int index;

  const LetterTile({super.key, required this.letter, required this.index});

  @override
  Widget build(BuildContext context) {
    return Draggable<int>(
      data: index,
      feedback: Material(
        child: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.blueAccent,
          child: Text(
            letter,
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
      childWhenDragging: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.grey,
        child: Text(
          letter,
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
      child: Consumer<GameProvider>(
        builder: (context, gameProvider, child) {
          return Container(
            padding: const EdgeInsets.all(10),
            color: Colors.blueAccent,
            child: Text(
              letter,
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
