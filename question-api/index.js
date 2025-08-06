const express = require('express');
const fs = require('fs');
const cors = require('cors');
const questions = require('./questions');

const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json());

// 🔁 Sağlık kontrolü (opsiyonel)
app.get('/', (req, res) => {
  res.send('Soru API’si çalışıyor 🚀');
});

// 🔎 Soruları getir
app.get('/questions', (req, res) => {
  const { type } = req.query;

  if (type) {
    const filtered = questions.filter(q => q.type === type);
    return res.json(filtered);
  }

  res.json(questions);
});

// ✅ Cevapları kaydet
app.post('/answers', (req, res) => {
  const newAnswer = req.body;
  const currentData = JSON.parse(fs.readFileSync('answers.json'));
  currentData.push(newAnswer);
  fs.writeFileSync('answers.json', JSON.stringify(currentData, null, 2));
  res.status(201).json({ message: 'Cevap başarıyla kaydedildi' });
});

app.get('/answers/latest', (req, res) => {
  const currentData = JSON.parse(fs.readFileSync('answers.json'));
  if (currentData.length === 0) {
    return res.status(404).json({ message: 'Henüz cevap yok' });
  }
  res.json(currentData[currentData.length - 1]);
});


// 🚀 Sunucuyu başlat
app.listen(PORT, () => {
  console.log(`✅ Soru API çalışıyor: http://localhost:${PORT}`);
});
