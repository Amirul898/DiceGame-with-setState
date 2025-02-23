import 'package:dice_game/game_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DiceGame());
}

class DiceGame extends StatelessWidget {
  const DiceGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GamePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
