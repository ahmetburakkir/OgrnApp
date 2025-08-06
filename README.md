# 🎯 Kişisel Karakter Analizi ve Kariyer Yönlendirme Uygulaması

Bu proje, lise öğrencilerinin kişisel karakter analizini yaparak kariyer yönlendirmesi sağlayan modern bir Flutter mobil uygulamasıdır.  
Kullanıcı, çoktan seçmeli soruları yanıtlayarak **AI tabanlı analiz** alır ve kendisine uygun kariyer yol haritasını görüntüler.

---

## 🚀 Özellikler

- 📌 **Kullanıcı Kaydı & Giriş** (E-posta/Şifre, Google, Anonim giriş)
- 🏠 **Kişiselleştirilmiş Ana Sayfa** – Kullanıcıya özel karşılama
- ❓ **MultiChoice Test Sistemi** – Sıralı şekilde ilerleyen sorular
- 🤖 **AI Tabanlı Karakter Analizi** – Gemini API ile kişiselleştirilmiş yorum
- 📊 **Kariyer Yol Haritası** – Test sonucuna göre öneriler
- 🎨 **Özel Renk Teması** – (#243642, #387478, #629584, #E2F1E7)

---

## 🛠 Kullanılan Teknolojiler

| Teknoloji | Açıklama |
|-----------|----------|
| **Flutter** | Mobil uygulama geliştirme çatısı |
| **Dart** | Flutter’ın programlama dili |
| **Node.js & Express.js** | Soru/cevap API’si |
| **Gemini API (Google Generative AI)** | AI tabanlı karakter analizi |
| **Firebase Auth** | Kimlik doğrulama sistemi |
| **REST API** | Soruların ve cevapların yönetimi |
| **Material Design** | Modern arayüz tasarımı |

---

## 📸 Ekran Görüntüleri

### 🔑 Login Sayfası
<img width="1250" height="689" alt="giriş" src="https://github.com/user-attachments/assets/eba09f96-93a9-41dc-8c22-3420897bf326" />

### 🏠 Home Page
<img width="1245" height="706" alt="homepage" src="https://github.com/user-attachments/assets/62d50f7e-773f-46b0-97bb-4c384aa5ad1d" />

### 📝 Test Page
<img width="1249" height="585" alt="sorular" src="https://github.com/user-attachments/assets/b968fe3e-018d-4c94-b51b-f424fcafe716" />

### 🤖 AI Analiz Sayfası
<img width="1274" height="721" alt="aianaliz" src="https://github.com/user-attachments/assets/383dc68a-1003-4ec3-94e5-076fa1820b76" />

---

## 📦 Kurulum

# 1. **Projeyi Klonla**
   ```bash
   git clone https://github.com/kullaniciadi/proje-adi.git
   cd proje-adi
# 2. Flutter Bağımlılıklarını Yükle
flutter pub get

# 3. Backend API’yi Çalıştır
cd backend
npm install
node server.js
# API varsayılan olarak http://localhost:3000 adresinde çalışır

# 4. Firebase Ayarlarını Yap
# - Firebase projesi oluştur
# - Authentication bölümünde e-posta/şifre, Google ve anonim giriş yöntemlerini aktif et
# - google-services.json dosyasını android/app/ klasörüne ekle

# 5. Gemini API Anahtarını Ekle
# lib/config/api_config.dart dosyasına aşağıdaki kodu ekle:
# class ApiConfig {
#   static const String geminiApiKey = "BURAYA_API_KEY";
#   static const String aiModel = "gemini-1.5-flash";
#   static const String baseUrl = "http://localhost:3000";
# }

# 6. Uygulamayı Çalıştır
flutter run
