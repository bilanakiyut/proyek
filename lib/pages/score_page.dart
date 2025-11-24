import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'home_page.dart';

class ScorePage extends StatelessWidget {
  final int score;
  final int total;
  final String quizType;

  const ScorePage({
    super.key,
    required this.score,
    required this.total,
    required this.quizType,
  });

  @override
  Widget build(BuildContext context) {
    double percent = (score / total) * 100;

    String message;
    if (percent == 100) {
      message = "Luar biasa! Semua benar!";
    } else if (percent >= 70) {
      message = "Bagus banget! Terus pertahankan!";
    } else if (percent >= 50) {
      message = "Lumayan! Yuk belajar lagi";
    } else {
      message = "Masih bisa lebih baik, semangat!";
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Hasil Quiz"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              "assets/lottie/reward.json", 
              height: 180,
              repeat: false,
            ),

            const SizedBox(height: 20),

            Text(
              quizType == "type2"
                  ? "Hasil Quiz: Conditional Type 2"
                  : quizType == "type3"
                      ? "Hasil Quiz: Conditional Type 3"
                      : "Hasil Quiz: Mixed Questions",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            Text(
              "$score / $total",
              style: const TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),

            const Spacer(),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HomePage(),
                  ),
                );
              },
              icon: const Icon(Icons.home),
              label: const Text("Kembali ke Beranda"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(
                    horizontal: 24, vertical: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
