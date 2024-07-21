import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/game_provider.dart';
import 'screens/game_screen.dart';
import 'screens/home_screen.dart';
import 'screens/instructions_screen.dart';
import 'screens/settings_screen.dart';
void main() {
  runApp( const PalavraMagica());
}

class PalavraMagica extends StatelessWidget {
  const PalavraMagica({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GameProvider()),
      ],
      child: MaterialApp(
        title: 'Palavra Mágica',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}