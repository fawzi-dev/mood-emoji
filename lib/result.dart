import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({super.key, required this.result});

  final String result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Center(
          child: Text(
            result,
            style: const TextStyle(
              fontSize: 14,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
