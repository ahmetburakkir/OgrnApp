import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/question_model.dart';

class QuestionService {
  static const String baseUrl = "http://192.168.56.1:3000"; // mobilde test edeceksen IP'yi değiştir

  Future<List<Question>> fetchQuestions() async {
    final response = await http.get(Uri.parse('$baseUrl/questions'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Question.fromJson(json)).toList();
    } else {
      throw Exception('Sorular yüklenemedi');
    }
  }
}
