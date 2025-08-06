import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://192.168.1.94:3000"; // kendi PC IP'n

  static Future<List<dynamic>> getQuestions() async {
    final response = await http.get(Uri.parse('$baseUrl/questions'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Sorular getirilemedi");
    }
  }

  static Future<bool> sendAnswers(List<Map<String, String>> answers) async {
    final response = await http.post(
      Uri.parse('$baseUrl/answers'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(answers),
    );
    return response.statusCode == 201;
  }

  static Future<String> analyzeAnswers(List<Map<String, String>> answers) async {
    final response = await http.post(
      Uri.parse('$baseUrl/analyze'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"answers": answers}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)["analysis"];
    } else {
      throw Exception("Analiz yapılamadı: ${response.statusCode}");
    }
  }
}
