import 'package:flutter/material.dart';

class InstructionsScreen extends StatelessWidget {
  const InstructionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instruções'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Como jogar:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              '1. Clique em "Iniciar Jogo" na tela inicial.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              '2. Arraste e solte as letras embaralhadas para formar a palavra correta.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              '3. Clique no botão "Verificar" para ver se a palavra está correta.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              '4. Se estiver correta, você passará para a próxima palavra.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              '5. Se estiver incorreta, tente novamente.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
