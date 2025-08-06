import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'result_page.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<dynamic> questions = [];
  int currentIndex = 0;
  List<Map<String, String>> answers = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    try {
      final data = await ApiService.getQuestions();
      setState(() {
        questions = data;
        loading = false;
      });
    } catch (e) {
      setState(() => loading = false);
    }
  }

  void _nextQuestion(String answer) {
    answers.add({
      "question": questions[currentIndex]["question"],
      "answer": answer
    });

    if (currentIndex < questions.length - 1) {
      setState(() => currentIndex++);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(answers: answers),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    if (questions.isEmpty) {
      return const Scaffold(
        body: Center(child: Text("Soru bulunamadı")),
      );
    }

    final q = questions[currentIndex];
    return Scaffold(
      appBar: AppBar(title: Text("Soru ${currentIndex + 1}")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(q["question"],
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ...q["options"].map<Widget>(
                  (opt) => Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _nextQuestion(opt),
                  child: Text(opt),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
