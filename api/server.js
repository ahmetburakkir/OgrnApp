const express = require("express");
const cors = require("cors");
const fs = require("fs-extra");
const { GoogleGenerativeAI } = require("@google/generative-ai");
const questions = require("./questions");

const app = express();
const PORT = 3000;

// Orijin izinleri ve JSON parse
app.use(cors());
app.use(express.json());

// 🔑 Google Gemini API key
const genAI = new GoogleGenerativeAI("AIzaSyBiLvQfqGFQiK6o0awbyJnlTNX-HLS_fMk");

// Soruları getir
app.get("/questions", (req, res) => {
  res.json(questions);
});

// Cevap kaydet
app.post("/answers", async (req, res) => {
  try {
    const newAnswer = req.body;
    const answers = await fs.readJson("answers.json");
    answers.push(newAnswer);
    await fs.writeJson("answers.json", answers, { spaces: 2 });
    res.status(201).json({ message: "Cevap kaydedildi" });
  } catch (error) {
    console.error("📌 /answers hatası:", error);
    res.status(500).json({ error: "Cevap kaydedilemedi", details: error.message });
  }
});

// AI Analizi
app.post("/analyze", async (req, res) => {
  try {
    const answers = req.body.answers;
    if (!answers || !Array.isArray(answers)) {
      console.log("📌 Geçersiz veri:", req.body);
      return res.status(400).json({ error: "Geçersiz veri" });
    }

    console.log("📌 Gelen cevaplar:", answers);

    const prompt = `
Sen bir eğitim danışmanısın. Aşağıdaki sorular ve cevaplara göre öğrencinin karakterini analiz et.
Kısa, net ve motive edici bir cevap ver.

${answers.map(a => `${a.question}: ${a.answer}`).join("\n")}
`;

    console.log("📌 Prompt:", prompt);

    const model = genAI.getGenerativeModel({ model: "gemini-1.5-flash" });
    const result = await model.generateContent(prompt);

    console.log("📌 Gemini cevabı:", result.response.text());

    res.json({ analysis: result.response.text() });
  } catch (error) {
    console.error("❌ AI Analiz Hatası:", error);
    res.status(500).json({ error: "Analiz yapılamadı", details: error.message, stack: error.stack });
  }
});

// Sunucuyu başlat
app.listen(PORT, () => {
  console.log(`✅ API http://localhost:${PORT} adresinde çalışıyor`);
});
