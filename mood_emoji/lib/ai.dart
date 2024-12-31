import 'package:google_generative_ai/google_generative_ai.dart';

class GoogleStudioAi {
  final model = GenerativeModel(
    model: 'gemini-1.5-flash',
    apiKey: 'AIzaSyCfBKrz7Xgz0vD_-oKeeup-TXBB3Sc0U4w',
    generationConfig: GenerationConfig(
      temperature: 1,
      topK: 40,
      topP: 0.95,
      maxOutputTokens: 8192,
      responseMimeType: 'text/plain',
    ),
  );

  Future<String> generate(String prompt) async {
    final chat = model.startChat(history: []);
    final message = 'INSERT_INPUT_HERE';
    final content = Content.text(message);

    final response = await chat.sendMessage(content);
    print(response.text);
    return response.text ?? ' ';
  }
}
