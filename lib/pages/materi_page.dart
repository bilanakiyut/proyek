import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../models/materi_model.dart';

class MateriPage extends StatelessWidget {
  final List<MateriModel> materiList;
  final List<Color> cardColors;

  const MateriPage({super.key, required this.materiList, required this.cardColors});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: materiList.length,
      itemBuilder: (context, index) {
        final materi = materiList[index];
        final color = cardColors[index % cardColors.length];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MateriDetailPage(materi: materi, color: color),
              ),
            );
          },
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            color: color.withOpacity(0.9),
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    materi.title,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    materi.description,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class MateriDetailPage extends StatefulWidget {
  final MateriModel materi;
  final Color color;

  const MateriDetailPage({super.key, required this.materi, required this.color});

  @override
  State<MateriDetailPage> createState() => _MateriDetailPageState();
}

class _MateriDetailPageState extends State<MateriDetailPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.materi.videoUrl);
    _controller = YoutubePlayerController(
      initialVideoId: videoId ?? '',
      flags: const YoutubePlayerFlags(autoPlay: false),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final materi = widget.materi;
    final color = widget.color;

    return Scaffold(
      appBar: AppBar(
        title: Text(materi.title),
        backgroundColor: color,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ✅ VIDEO DIPERKECIL
            Container(
              height: 180, // ➜ ukuran video diperkecil
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.black,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: color,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lesson Goal",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: color,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      materi.description,
                      style: GoogleFonts.poppins(fontSize: 14, height: 1.6),
                    ),

                    if (materi.formula.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      Text(
                        "Formula",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: color,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          materi.formula,
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                      ),
                    ],

                    if (materi.examples.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      Text(
                        "Lesson Plan",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: color,
                        ),
                      ),
                      const SizedBox(height: 8),

                      ...materi.examples.map(
                        (ex) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            "• $ex",
                            style: GoogleFonts.poppins(fontSize: 14),
                          ),
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
