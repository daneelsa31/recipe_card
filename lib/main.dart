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
              // ... inside your Container ...
              // ... inside your Container ...
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 1. The Image with rounded top corners
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1598103442097-8b74394b95c6?q=80&w=1000&auto=format&fit=crop',
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      // 2. The Title Section
                      const Padding(
                        padding: EdgeInsets.fromLTRB(28.0, 20.0, 28.0, 20.0),
                        child: Text(
                          'Lemon Herb Roasted\nChicken',
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF1D2D35),
                            height: 1.1,
                            letterSpacing: -1.0,
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                  // The FloatingHeart will go here in a future commit!
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
