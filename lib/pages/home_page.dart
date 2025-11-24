import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/materi_model.dart';
import 'materi_page.dart';
import 'quiz_page.dart';
import 'score_overwiew_page.dart';
import '../data/questions_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  String searchText = '';

  List<MateriModel> getFilteredMateri() {
    return materiList.where((m) {
      bool typeFilter =
          m.title.contains('Type 2') || m.title.contains('Type 3');
      bool searchFilter = searchText.isEmpty
          ? true
          : m.title.toLowerCase().contains(searchText.toLowerCase());
      return typeFilter && searchFilter;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredMateri = getFilteredMateri();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: _currentIndex == 0
            ? buildMateriGrid(filteredMateri)
            : _currentIndex == 1
                ? buildQuizMenu()
                : const ScoreOverviewPage(),
      ),
      bottomNavigationBar: buildBottomNavbar(),
    );
  }

  // ===================== GRID VIEW MATERI ======================
  Widget buildMateriGrid(List<MateriModel> filteredMateri) {
    final List<Color> gradientStart = [
      Colors.teal.shade400,
      Colors.cyan.shade400,
      Colors.blue.shade400,
      Colors.green.shade400,
    ];

    final List<Color> gradientEnd = [
      Colors.teal.shade600,
      Colors.cyan.shade700,
      Colors.blue.shade700,
      Colors.green.shade700,
    ];

    return Column(
      children: [
        // HEADER
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 28),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal.shade400, Colors.cyan.shade400],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Nabila 👋',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Selamat belajar Conditional Sentences!',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.85),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // SEARCH BAR
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: TextField(
              onChanged: (val) => setState(() => searchText = val),
              decoration: InputDecoration(
                hintText: 'Cari materi...',
                prefixIcon: Icon(Icons.search, color: Colors.teal.shade600),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              ),
            ),
            ),
          ),
        ),

        const SizedBox(height: 18),

        // GRID VIEW
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 0.88,
              ),
              itemCount: filteredMateri.length,
              itemBuilder: (context, index) {
                final materi = filteredMateri[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MateriDetailPage(
                          materi: materi,
                          color: gradientStart[index % gradientStart.length],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          gradientStart[index % gradientStart.length],
                          gradientEnd[index % gradientEnd.length],
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: gradientStart[index % gradientStart.length]
                              .withOpacity(0.4),
                          blurRadius: 6,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.menu_book_rounded,
                            size: 42, color: Colors.white),
                        const SizedBox(height: 12),
                        Text(
                          materi.title,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          materi.description,
                          style: GoogleFonts.poppins(
                              fontSize: 12, color: Colors.white70),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  // ==================== QUIZ MENU ====================
  Widget buildQuizMenu() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade600,
        elevation: 0,
        title: Text(
          "Quiz Menu",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pilih Jenis Quiz",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.teal.shade700,
                ),
              ),
              const SizedBox(height: 28),
              quizCard(
                title: "Conditional Type 2",
                icon: Icons.timeline_rounded,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => QuizPage(
                        questions: QuestionsData.type2Questions,
                        quizType: "type2",
                      ),
                    ),
                  );
                },
              ),
              quizCard(
                title: "Conditional Type 3",
                icon: Icons.auto_fix_high_rounded,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => QuizPage(
                        questions: QuestionsData.type3Questions,
                        quizType: "type3",
                      ),
                    ),
                  );
                },
              ),
              quizCard(
                title: "Mixed Quiz (Tipe 2 + 3)",
                icon: Icons.all_inclusive_rounded,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => QuizPage(
                        questions: QuestionsData.mixQuestions,
                        quizType: "mix",
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget quizCard({
    required String title,
    required IconData icon,
    required Function() onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
        shadowColor: Colors.teal.withOpacity(0.2),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          splashColor: Colors.teal.withOpacity(0.15),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Colors.teal.shade200,
                width: 1.2,
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.teal.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    icon,
                    color: Colors.teal.shade700,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Colors.teal.shade800,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                  color: Colors.teal.shade500,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ====================== BOTTOM NAVBAR ======================
  Widget buildBottomNavbar() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: Colors.white,
          selectedItemColor: Colors.teal.shade600,
          unselectedItemColor: Colors.grey.shade700,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded, size: 28),
              label: 'Materi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.quiz, size: 28),
              label: 'Quiz',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_rounded, size: 28),
              label: 'Skor',
            ),
          ],
        ),
      ),
    );
  }
}
