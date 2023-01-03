import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {

  final int difficultyLevel;

  const Difficulty({
    required this.difficultyLevel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, size: 15, color: (this.difficultyLevel >= 1 ? Colors.blue: Colors.blue[100]),),
        Icon(Icons.star, size: 15, color: (this.difficultyLevel >= 2 ? Colors.blue: Colors.blue[100]),),
        Icon(Icons.star, size: 15, color: (this.difficultyLevel>= 3 ? Colors.blue: Colors.blue[100]),),
        Icon(Icons.star, size: 15, color: (this.difficultyLevel >= 4 ? Colors.blue: Colors.blue[100]),),
        Icon(Icons.star, size: 15, color: (this.difficultyLevel >= 5 ? Colors.blue: Colors.blue[100]),),
      ],
    );
  }
}

