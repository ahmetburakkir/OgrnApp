import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'test_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'OGRN ∆P',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: "Ayarlar",
            onPressed: () {}, // placeholder
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _heroHeader(),
            const SizedBox(height: 20),
            _assessmentIntro(context),
            const SizedBox(height: 20),
            _sectionTitle("Kariyer Testi Nasıl Çalışır?"),
            _howItWorks(),
            const SizedBox(height: 24),
            _sectionTitle("İlginizi Çekebilecek Alanlar"),
            _popularFieldsSection(),
          ],
        ),
      ),
    );
  }

  Widget _heroHeader() {
    return Container(
      width: double.infinity,
      color: AppColors.primary,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Akademik Yolculuğuna Hazır mısın?",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 12),
          Text(
            "Kariyer testiyle kendine uygun bölümü bul, güçlü yönlerini keşfet.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white.withOpacity(0.9)),
          ),
        ],
      ),
    );
  }

  Widget _assessmentIntro(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const TestPage()));
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.subtle.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(Icons.psychology, color: AppColors.secondary, size: 36),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  "Kariyer Testine Başla",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.subtle),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),
    );
  }

  Widget _howItWorks() {
    final steps = [
      ("1", "Testi Uygula", "8 soruluk kariyer uyumluluk testini çöz."),
      ("2", "Analiz Al", "Kişilik tipini ve güçlü yönlerini öğren."),
      ("3", "Yön Belirle", "Sana uygun meslek ve bölümleri keşfet."),
    ];

    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: steps.length,
        itemBuilder: (context, index) {
          final s = steps[index];
          return Container(
            width: 160,
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.subtle),
              boxShadow: [
                BoxShadow(
                  color: AppColors.subtle.withOpacity(0.2),
                  blurRadius: 4,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.secondary,
                  child: Text(s.$1, style: const TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 10),
                Text(s.$2, style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary)),
                const SizedBox(height: 6),
                Text(
                  s.$3,
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _popularFieldsSection() {
    final fields = [
      {
        'title': 'Psikoloji',
        'icon': Icons.psychology_alt,
        'desc': 'İnsan davranışlarını anlamaya ve danışmanlığa ilgi duyanlar için.'
      },
      {
        'title': 'Yazılım Mühendisliği',
        'icon': Icons.computer,
        'desc': 'Problem çözmeyi, algoritmaları ve teknolojiyi sevenler için.'
      },
      {
        'title': 'Tasarım & Sanat',
        'icon': Icons.palette,
        'desc': 'Estetik, yaratıcılık ve görsel anlatımla ilgilenenler için.'
      },
      {
        'title': 'İşletme & Girişimcilik',
        'icon': Icons.business_center,
        'desc': 'Kendi işini kurmak veya yöneticilik yapmak isteyenler için.'
      },
    ];

    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: fields.length,
        itemBuilder: (context, index) {
          final f = fields[index];
          return Container(
            width: 240,
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.subtle),
              boxShadow: [
                BoxShadow(
                  color: AppColors.subtle.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(f['icon'] as IconData, size: 36, color: AppColors.secondary),
                const SizedBox(height: 12),
                Text(
                  f['title'] as String,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  f['desc'] as String,
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
