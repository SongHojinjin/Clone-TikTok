import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'TikTok Clone',
    theme: ThemeData(
      primaryColor: const Color(0xFFE9435A),
    ),
    home: SignUpScreen(),
    );
  }
}

void main() {
  runApp(const TikTokApp());
}