import 'package:flutter/material.dart';

class SelectEmojis extends StatefulWidget {
  const SelectEmojis({super.key});

  @override
  State<SelectEmojis> createState() => _SelectEmojisState();
}

class _SelectEmojisState extends State<SelectEmojis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          children: [],
        ),
      ),
    );
  }
}
