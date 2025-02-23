import 'dart:math';

import 'package:dice_game/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  GamePageState createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  final diceList = [
    'assets/Image/one.png',
    'assets/Image/two.png',
    'assets/Image/three.png',
    'assets/Image/four.png',
    'assets/Image/five.png',
    'assets/Image/six.png',
  ];

  int indexOne = 0;
  int indexTwo = 0;
  int diceSum = 0;
  String rusult = "";

  final randomDiceNumber = Random.secure();

  void randomeDice() {
    setState(() {
      indexOne = randomDiceNumber.nextInt(6);
      indexTwo = randomDiceNumber.nextInt(6);
      diceSum = indexOne + indexTwo + 2;

      if (diceSum == 7 || diceSum == 11) {
        rusult = "You Win !!";
      } else if (diceSum == 2 || diceSum == 3 || diceSum == 12) {
        rusult = "You Lose !!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            diceImage(),
            SizedBox(height: 60),
            dicesum(),
            Text(rusult),
            SizedBox(height: 60),
            DiceButton(),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  SizedBox DiceButton() {
    return SizedBox(
      width: 200,
      height: 55,
      child: ElevatedButton(
        onPressed: () {
          randomeDice();
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          backgroundColor: Colors.red,
        ),
        child: Text(
          "Rolling",
          style: GoogleFonts.hanaleiFill().copyWith(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Row dicesum() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Your Dice Sum is :", style: textStyle.copyWith()),
        SizedBox(width: 10),
        Text(
          " $diceSum",
          style: textStyle.copyWith(color: Colors.red, fontSize: 35),
        ),
      ],
    );
  }

  Row diceImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(diceList[indexOne], width: 80, height: 80),
        SizedBox(width: 10),
        Image.asset(diceList[indexTwo], width: 80, height: 80),
      ],
    );
  }
}
