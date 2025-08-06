import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../theme/app_colors.dart';
import 'home_page.dart';

class ResultPage extends StatefulWidget {
  final List<Map<String, String>> answers;

  const ResultPage({super.key, required this.answers});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool _loading = true;
  String? aiResult;
  bool _sendSuccess = false;

  @override
  void initState() {
    super.initState();
    _processResults();
  }

  Future<void> _processResults() async {
    try {
      // 1️⃣ Cevapları backend'e kaydet
      final sent = await ApiService.sendAnswers(widget.answers);

      // 2️⃣ AI analizi al
      final analysis = await ApiService.analyzeAnswers(widget.answers);

      setState(() {
        _loading = false;
        _sendSuccess = sent;
        aiResult = analysis;
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _sendSuccess = false;
        aiResult = "Analiz yapılamadı: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: _loading
            ? const CircularProgressIndicator()
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _sendSuccess ? Icons.check_circle : Icons.error,
              size: 64,
              color: _sendSuccess ? Colors.green : Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              _sendSuccess
                  ? "Sonuçlar başarıyla gönderildi!"
                  : "Sonuçlar gönderilemedi!",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24),
            Text(
              "AI Analizi:",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                aiResult ?? "",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomePage()),
                      (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary),
              child: const Text("Ana Sayfaya Dön",
                  style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
