import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'English Quiz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // ===== WARNA UTAMA & ACCENT =====
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,   // warna utama
          primary: Colors.teal.shade600,
          secondary: Colors.cyan.shade400,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Colors.grey[100],

        // ===== APPBAR STYLE =====
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal.shade600,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),

        // ===== TEXT THEME =====
        textTheme: GoogleFonts.poppinsTextTheme(),
        
        // ===== ELEVATED BUTTON STYLE =====
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal.shade600,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textStyle: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),

        // ===== INPUT DECORATION =====
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),

        // ===== ICON THEME =====
        iconTheme: IconThemeData(
          color: Colors.teal.shade700,
        ),
      ),
      home: const HomePage(),
    );
  }
}
