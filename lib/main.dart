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

                      // 3. The Unified Stats Section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        child: Wrap(
                          spacing: 20, // Gap between items side-by-side
                          runSpacing:
                              16, // THIS adds the gap between the top and bottom rows!
                          children: const [
                            _StatItem(
                              icon: Icons.access_time_filled,
                              text: "Prep: 15 min",
                            ),
                            _StatItem(
                              icon: Icons.stars,
                              text: "Difficulty: Easy",
                            ),
                            _StatItem(
                              icon: Icons.kitchen,
                              text: "Cook: 45 min",
                            ),
                          ],
                        ),
                      ),

                      // 4. Ingredients Heading
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

                      // 5. Bulleted List
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
                    ],
                  ),
                  
                  // 6. The Floating Heart Button
                  Positioned(
                    bottom: 20, // Distance from the bottom of the card
                    right: 20, // Distance from the right of the card
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
                          color: Color.fromARGB(255, 0, 0, 0),
                          size: 28,
                        ),
                        onPressed: () {
                          print("Favorite tapped!");
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
            ), // The slate-blue color from your image
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
