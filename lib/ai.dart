import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GoogleStudioAi {
  final model = GenerativeModel(
    model: 'gemini-1.5-flash',
    apiKey: dotenv.env['API'] ?? '',
    generationConfig: GenerationConfig(
      temperature: 1,
      topK: 40,
      topP: 0.95,
      maxOutputTokens: 8192,
      responseMimeType: 'text/plain',
      stopSequences: ['\n\n'],
    ),
  );

  Future<String> generate(String prompt) async {
    final chat = model.startChat(history: []);
    final message =
        'Write a heartfelt and inspiring message based on this emoji $prompt (Do not include any steps in the message just a pure message)';
    final content = Content.text(message);

    final response = await chat.sendMessage(content);
    return response.text ?? ' ';
  }
}
