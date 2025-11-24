import 'package:shared_preferences/shared_preferences.dart';

class ScoreService {
  static Future<void> saveScore(String quizType, int score) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> oldScores = prefs.getStringList(quizType) ?? [];

    oldScores.add(score.toString());
    await prefs.setStringList(quizType, oldScores);
  }

  static Future<List<int>> getScores(String quizType) async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList(quizType) ?? [];
    return data.map((e) => int.parse(e)).toList();
  }
}
