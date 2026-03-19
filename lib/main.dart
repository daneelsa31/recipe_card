import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // The Scaffold is our "Canvas"
    return Scaffold(
      backgroundColor: const Color(0xFFDDE5E9), // The grey-blue background
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Container(
              width: 400,
              // For now, we give it a height so you can see it on screen
              // We will remove this height later so it grows with the text
              constraints: const BoxConstraints(minHeight: 500), 
              decoration: BoxDecoration(
                color: const Color(0xFFFAF9F6), // The off-white card color
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}