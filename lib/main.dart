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
    return Scaffold(
      backgroundColor: const Color(0xFFDDE5E9),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Container(
              width: 400,
              decoration: BoxDecoration(
                color: const Color(0xFFFAF9F6),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.12), // Slightly deeper
                    blurRadius: 30, // Softer spread
                    offset: const Offset(0, 15), // Higher lift
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                        child: Image.network(
                          'https://greendale.com/cdn/shop/articles/garlic-lemon-roast-chicken_eb6064d1-9979-42fd-a150-6ee9d548d7a3.jpg?v=1771521242&width=2000',
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        child: Wrap(
                          spacing: 20,
                          runSpacing: 16,
                          children: const [
                            _StatItem(icon: Icons.access_time_filled, text: "Prep: 15 min"),
                            _StatItem(icon: Icons.stars, text: "Difficulty: Easy"),
                            _StatItem(icon: Icons.kitchen, text: "Cook: 45 min"),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(28.0, 20.0, 28.0, 15.0),
                        child: Text(
                          'Ingredients',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF1D2D35),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 28.0),
                        child: Column(
                          children: [
                            _IngredientItem(text: "1 whole chicken"),
                            _IngredientItem(text: "2 lemons, sliced"),
                            _IngredientItem(text: "4 cloves garlic, crushed"),
                            _IngredientItem(text: "3 sprigs fresh rosemary"),
                            _IngredientItem(text: "2 tbsp olive oil"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40), // Breathing room at bottom
                    ],
                  ),
                  Positioned(
                    bottom: 25,
                    right: 25,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.15),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.black,
                          size: 28,
                        ),
                        onPressed: () {
                          debugPrint("Favorite tapped!"); // Lint-friendly logging
                        },
                      ),
                    ),
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

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _StatItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // The Blue Icon Box
        Container(
          padding: const EdgeInsets.all(7), // Spacing inside the blue box
          decoration: BoxDecoration(
            color: const Color(
              0xFF6A8CAF,
            ), // The slate-blue color
            borderRadius: BorderRadius.circular(
              8,
            ), // Rounded corners for the icon box
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 12), // Gap between icon and text
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF1D2D35),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _IngredientItem extends StatelessWidget {
  final String text;
  const _IngredientItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Aligns bullet to the top line
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8.0, right: 12.0),
            child: CircleAvatar(radius: 3, backgroundColor: Color(0xFF1D2D35)),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 17,
                color: Color(0xFF1D2D35),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
