import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../service/score_service.dart';

class ScoreOverviewPage extends StatefulWidget {
  const ScoreOverviewPage({super.key});

  @override
  State<ScoreOverviewPage> createState() => _ScoreOverviewPageState();
}

class _ScoreOverviewPageState extends State<ScoreOverviewPage> {
  int type2Score = 0;
  int type3Score = 0;
  int mixedScore = 0;

  @override
  void initState() {
    super.initState();
    loadScores();
  }

  Future<void> loadScores() async {
    List<int> t2 = await ScoreService.getScores("type2");
    List<int> t3 = await ScoreService.getScores("type3");
    List<int> mix = await ScoreService.getScores("mix");

    setState(() {
      type2Score = t2.isNotEmpty ? t2.last : 0;
      type3Score = t3.isNotEmpty ? t3.last : 0;
      mixedScore = mix.isNotEmpty ? mix.last : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.teal.shade600,
        elevation: 0,
        title: Text(
          "Riwayat Skor",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              "Skor Terakhir Kamu",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade800,
              ),
            ),
            const SizedBox(height: 20),
            _scoreBox("Type 2", type2Score, Colors.teal.shade400, Colors.teal.shade600),
            const SizedBox(height: 16),
            _scoreBox("Type 3", type3Score, Colors.cyan.shade400, Colors.cyan.shade600),
            const SizedBox(height: 16),
            _scoreBox("Mixed (2 + 3)", mixedScore, Colors.orange.shade400, Colors.orange.shade600),
          ],
        ),
      ),
    );
  }

  Widget _scoreBox(String title, int score, Color startColor, Color endColor) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [startColor, endColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: startColor.withOpacity(0.4),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Text(
            "$score",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
