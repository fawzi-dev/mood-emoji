import 'package:flutter/material.dart';

class SelectEmojis extends StatefulWidget {
  const SelectEmojis({super.key});

  @override
  State<SelectEmojis> createState() => _SelectEmojisState();
}

class _SelectEmojisState extends State<SelectEmojis> {
  String selectedEmoji = '';

  final smileys = [
    "😊", // Smiling Face with Smiling Eyes
    "😍", // Heart Eyes
    "😂", // Tears of Joy
    "🤔", // Thinking Face
    "😢", // Crying Face
    "😡", // Pouting Face
    "😱", // Screaming in Fear
    "🙂", // Slightly Smiling Face
    "🙃", // Upside-Down Face
    "🥺", // Pleading Face
    "🤗", // Hugging Face
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Emojis"),
      ),
      body: Center(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemCount: smileys.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedEmoji = smileys[index];
                });
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    width: 2,
                    color: selectedEmoji == smileys[index] ? Colors.green : Colors.grey,
                  ),
                ),
                child: Center(
                  child: Text(
                    smileys[index],
                    style: TextStyle(fontSize: 28),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
