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
    final message = 'Write a heartfelt happy new year message based on this emoji $prompt (Do not include any steps in the message just a pure message)';
    final content = Content.text(message);

    final response = await chat.sendMessage(content);
    print(response.text);
    return response.text ?? ' ';
  }
}
