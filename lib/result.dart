import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            style: GoogleFonts.ibmPlexSansArabic(),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
