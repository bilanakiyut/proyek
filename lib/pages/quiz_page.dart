import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/questions_model.dart';
import 'score_page.dart';
import '../service/score_service.dart';

class QuizPage extends StatefulWidget {
  final List<Question> questions;
  final String quizType;

  const QuizPage({
    Key? key,
    required this.questions,
    required this.quizType,
  }) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late final List<Question> _questions;
  int _currentIndex = 0;
  int _score = 0;
  int? selectedIndex;
  Map<String, String> _selectedMatches = {};

  @override
  void initState() {
    super.initState();
    _questions = widget.questions;
  }

  void _showAlert(bool isCorrect, {String? correctText}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isCorrect ? Icons.check_circle_outline : Icons.cancel_outlined,
                size: 70,
                color: isCorrect ? Colors.green.shade600 : Colors.red.shade600,
              ),
              const SizedBox(height: 16),
              Text(
                isCorrect ? "Jawaban Kamu Benar!" : "Jawaban Masih Salah",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              if (!isCorrect && correctText != null) ...[
                const SizedBox(height: 12),
                Text(
                  "Jawaban yang benar:\n$correctText",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.grey.shade800,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _nextQuestion();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade700,
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  "Lanjut",
                  style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _checkChoice(String answer) {
    final q = _questions[_currentIndex];
    bool correct =
        answer.trim().toLowerCase() == q.correct!.trim().toLowerCase();

    if (correct) _score++;

    _showAlert(correct, correctText: q.correct);
  }

  void _checkMatching() {
    final q = _questions[_currentIndex];
    bool correct = true;

    q.correctPairs!.forEach((left, right) {
      if (_selectedMatches[left] != right) correct = false;
    });

    if (correct) _score++;

    final correctText = q.correctPairs!.entries
        .map((e) => "${e.key} → ${e.value}")
        .join("\n");

    _showAlert(correct, correctText: correctText);
  }

  void _nextQuestion() async {
    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
        selectedIndex = null;
        _selectedMatches.clear();
      });
      return;
    }

    await ScoreService.saveScore(widget.quizType, _score);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ScorePage(
          score: _score,
          total: _questions.length,
          quizType: widget.quizType,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final q = _questions[_currentIndex];

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.teal.shade600,
        elevation: 8,
        shadowColor: Colors.teal.withOpacity(0.4),
        title: Text(
          "Quiz",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress bar
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: (_currentIndex + 1) / _questions.length,
                color: Colors.teal.shade600,
                backgroundColor: Colors.grey.shade300,
                minHeight: 10,
              ),
            ),
            const SizedBox(height: 24),

            // Text Soal
            Text(
              "Soal ${_currentIndex + 1} dari ${_questions.length}",
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Text(
                q.question,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade900,
                ),
              ),
            ),

            // Pilihan Ganda
            if (q.type == "choice")
              ...q.options!.asMap().entries.map((entry) {
                int index = entry.key;
                String opt = entry.value;

                bool isSelected = selectedIndex == index;

                return GestureDetector(
                  onTap: () {
                    setState(() => selectedIndex = index);
                    _checkChoice(opt);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                    margin: const EdgeInsets.only(bottom: 14),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.teal.shade50 : Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: isSelected ? Colors.teal.shade600 : Colors.grey.shade300,
                        width: isSelected ? 2.5 : 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(isSelected ? 0.1 : 0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      opt,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isSelected ? Colors.teal.shade800 : Colors.black87,
                      ),
                    ),
                  ),
                );
              }),

            // Matching
            if (q.type == "matching")
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: ListView(
                              children: q.matchLeft!.map(
                                (left) => Draggable<String>(
                                  data: left,
                                  feedback: Material(
                                    color: Colors.transparent,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.teal.shade100,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        left,
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          color: Colors.teal.shade700,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      left,
                                      style: GoogleFonts.poppins(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ).toList(),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ListView(
                              children: q.matchRight!.map(
                                (right) {
                                  String? matchedLeft;
                                  _selectedMatches.forEach((l, r) {
                                    if (r == right) matchedLeft = l;
                                  });

                                  return DragTarget<String>(
                                    onAccept: (left) {
                                      setState(() {
                                        _selectedMatches[left] = right;
                                      });
                                    },
                                    builder: (context, _, __) => Container(
                                      padding: const EdgeInsets.all(14),
                                      margin: const EdgeInsets.only(bottom: 14),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.teal.shade400),
                                        borderRadius: BorderRadius.circular(12),
                                        color: matchedLeft != null ? Colors.teal.shade50 : Colors.white,
                                      ),
                                      child: Text(
                                        matchedLeft == null
                                            ? right
                                            : "$matchedLeft → $right",
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          color: Colors.teal.shade900,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: (_selectedMatches.length == q.matchLeft!.length)
                          ? _checkMatching
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal.shade700,
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(
                        "Check",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
