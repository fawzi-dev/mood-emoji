import 'package:flutter/material.dart';
import 'package:mood_emoji/ai.dart';
import 'package:mood_emoji/result.dart';

class SelectEmojis extends StatefulWidget {
  const SelectEmojis({super.key});

  @override
  State<SelectEmojis> createState() => _SelectEmojisState();
}

class _SelectEmojisState extends State<SelectEmojis> {
  String selectedEmoji = '';
  bool isLoading = false;

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
    "🤓", // Nerd Face
    "😎", // Smiling Face with Sunglasses
    "🥹", // Grinning Face with Big Eyes
    "🤤", // Drooling Face
    "😪", // Relieved Face
    "😴", // Sleeping Face
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
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            minimumSize: const Size.fromHeight(50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () async {
            setState(() {
              isLoading = true;
            });
            final String result = await GoogleStudioAi().generate(selectedEmoji);
            setState(() {
              isLoading = false;
            });
            if (context.mounted) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Result(result: result)));
            }
          },
          child: isLoading
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const CircularProgressIndicator(color: Colors.white),
                )
              : const Text("Submit"),
        ),
      ),
    );
  }
}
