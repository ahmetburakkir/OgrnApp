import 'package:google_generative_ai/google_generative_ai.dart';
import '../config/api_config.dart';

class AIService {
  static final GenerativeModel _model = GenerativeModel(
    model: ApiConfig.aiModel,
    apiKey: ApiConfig.geminiApiKey,
  );

  static Future<String> analyzeAnswers(List<Map<String, String>> answers) async {
    final prompt = """
Sen bir eğitim danışmanısın. Aşağıdaki çoktan seçmeli sorular ve cevaplara göre öğrencinin karakterini analiz et.
Kısa, net ve kullanıcıya motivasyon verecek şekilde cevap ver.

Cevaplar:
${answers.map((a) => "${a['question']}: ${a['answer']}").join("\n")}
""";

    final content = [Content.text(prompt)];
    final response = await _model.generateContent(content);
    return response.text ?? "Analiz yapılamadı.";
  }
}
