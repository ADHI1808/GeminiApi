import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:smanagement/models/ai_message_model.dart';

class ChatRepo {
  static Future<String> aiTextGenerationRepo(List<AiMessageModel> previousMessages) async {
    try {
      Dio dio = Dio();
      const apiKey = "Your API"; // Store securely

      final response = await dio.post(
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$apiKey",
        data: {
          "contents": previousMessages.map((e) => e.toMap()).toList(),
          "generationConfig": {
            "temperature": 0.5,
            "topK": 40,
            "topP": 0.95,
            "maxOutputTokens": 8192,
            "responseMimeType": "text/plain"
          }
        },
      );
      if(response.statusCode!>=200 && response.statusCode!<300){
        return response.data['candidates'].first['content']['parts'].first['text'];
      }

      return '';
    } catch (e) {
      log(e.toString());
      return '';
    }
  }
}
