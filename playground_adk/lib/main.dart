import 'package:flutter/material.dart';
import 'core/layout/playground_shell.dart';

void main() {
  runApp(const PlaygroundApp());
}

class PlaygroundApp extends StatelessWidget {
  const PlaygroundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DesignKit Playground',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(),
      home: const PlaygroundShell(),
    );
  }

  ThemeData _buildTheme() {
    const primary = Color(0xFF6366F1); // indigo-500
    const surface = Color(0xFF1E293B);
    const background = Color(0xFF0F172A);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: primary,
        secondary: const Color(0xFF818CF8),
        surface: surface,
        onPrimary: Colors.white,
        onSurface: const Color(0xFFE2E8F0),
      ),
      scaffoldBackgroundColor: background,
      fontFamily: 'Roboto',
      cardTheme: CardThemeData(
        color: surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Color(0xFF334155)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}