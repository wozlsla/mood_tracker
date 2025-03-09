import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mood_tracker/models/emotion.dart';
import 'package:mood_tracker/models/gpt_prompt.dart';

class GptRepository {
  static const String apiUrl = "https://api.openai.com/v1/chat/completions";
  static String apiKey = dotenv.env["OPENAI_API_KEY"] ?? "";

  Future<String> getSentence(Emotion emotion) async {
    final List<Map<String, String>> messages = getGptMessages(emotion);

    final Map<String, dynamic> requestBody = {
      "model": "gpt-4o-mini",
      "messages": messages,
      "max_tokens": 30,
      "temperature": 1,
      "top_p": 0.9,
      "frequency_penalty": 0.5,
      "presence_penalty": 0.5,
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $apiKey",
      },
      body: jsonEncode(requestBody),
    );

    final decodedBody = utf8.decode(response.bodyBytes);
    final Map<String, dynamic> responseData = jsonDecode(decodedBody);

    if (response.statusCode == 200) {
      String generatedSentence =
          responseData["choices"][0]["message"]["content"] ??
          "Can't get a sentence";
      return '"$generatedSentence"';
    } else {
      throw Exception("Get Sentence Failed: ${response.body}");
    }
  }
}
