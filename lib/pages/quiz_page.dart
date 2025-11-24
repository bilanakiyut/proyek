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

  // ==========================
  //        ALERT BAGUS
  // ==========================
  void _showAlert(bool isCorrect, {String? correctText}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isCorrect ? Icons.check_circle : Icons.cancel,
                size: 70,
                color: isCorrect ? Colors.green : Colors.red,
              ),
              const SizedBox(height: 16),

              Text(
                isCorrect ? "Jawaban Kamu Benar!" : "Jawaban Masih Salah",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              if (!isCorrect && correctText != null) ...[
                const SizedBox(height: 10),
                Text(
                  "Jawaban yang benar:\n$correctText",
                  style: GoogleFonts.poppins(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _nextQuestion();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(
                      vertical: 12, horizontal: 22),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Lanjut"),
              )
            ],
          ),
        ),
      ),
    );
  }

  // ==========================
  //        CEK PILIHAN
  // ==========================
  void _checkChoice(String answer) {
    final q = _questions[_currentIndex];
    bool correct =
        answer.trim().toLowerCase() == q.correct!.trim().toLowerCase();

    if (correct) _score++;

    _showAlert(correct, correctText: q.correct);
  }

  // ==========================
  //    CEK MATCHING
  // ==========================
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

  // ==========================
  //    NEXT QUESTION
  // ==========================
  void _nextQuestion() async {
    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
        selectedIndex = null;        // reset pilihan
        _selectedMatches.clear();     // reset matching
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
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
      toolbarHeight: 70,
      automaticallyImplyLeading: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal.shade700,
              Colors.teal.shade400,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
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
            // ==========================
            //    PROGRESS BAR
            // ==========================
            LinearProgressIndicator(
              value: (_currentIndex + 1) / _questions.length,
              color: Colors.teal,
              backgroundColor: Colors.grey[300],
            ),
            const SizedBox(height: 20),

            Text("Soal ${_currentIndex + 1} dari ${_questions.length}",
                style: GoogleFonts.poppins(fontSize: 15)),
            const SizedBox(height: 12),

            // ==========================
            //         KOTAK SOAL
            // ==========================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Text(
                q.question,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // ==========================
            //     JENIS PILIHAN GANDA
            // ==========================
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue.shade100 : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected ? Colors.blue : Colors.teal,
                        width: isSelected ? 2.5 : 1.5,
                      ),
                    ),
                    child: Text(
                      opt,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: isSelected
                            ? Colors.blue.shade900
                            : Colors.black87,
                      ),
                    ),
                  ),
                );
              }),

            // ==========================
            //     MATCHING TYPE
            // ==========================
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
                                    child: Text(
                                      left,
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.teal),
                                    ),
                                  ),
                                  child: ListTile(title: Text(left)),
                                ),
                              ).toList(),
                            ),
                          ),

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
                                      padding: const EdgeInsets.all(12),
                                      margin: const EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.teal),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        matchedLeft == null
                                            ? right
                                            : "$matchedLeft → $right",
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

                    ElevatedButton(
                      onPressed: (_selectedMatches.length ==
                              q.matchLeft!.length)
                          ? _checkMatching
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                      ),
                      child: const Text("Check"),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
