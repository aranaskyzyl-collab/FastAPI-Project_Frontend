// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:crops_disease/screens/QA_page.dart';
import 'package:crops_disease/screens/rice_blast_page.dart';
import 'package:crops_disease/screens/sheath_blight_page.dart';
import 'package:crops_disease/screens/upload_image_page.dart';
import 'package:crops_disease/screens/variety/variety.dart';
import 'package:crops_disease/screens/profile_page.dart';
import 'package:crops_disease/screens/brown_spot.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CropGuard AI',
      theme: ThemeData(
        useMaterial3: true,
        // Using a consistent professional green palette
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2D6A4F),
          primary: const Color(0xFF2D6A4F),
          secondary: const Color(0xFF40916C),
        ),
        fontFamily: 'Sans-Serif', // Ensure you have a clean font
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // List of screens for navigation
  final List<Widget> _pages = [
    const HomeContent(),
    const QAPage(),
    const VarietyPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F2), // Slightly cooler grey-green
      extendBody: true,
      appBar: _selectedIndex == 0
          ? AppBar(
              centerTitle: false,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              title: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Good Morning,",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                            letterSpacing: 0.5)),
                    const Text("Farmer Aranas 🌱",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Color(0xFF1B4332))),
                  ],
                ),
              ),
              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.05), blurRadius: 10)
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.notifications_none_rounded,
                        color: Color(0xFF2D6A4F)),
                    onPressed: () {},
                  ),
                ),
              ],
            )
          : null, // Hide custom appbar on other pages to let them use their own

      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),

      floatingActionButton: FloatingActionButton(
        elevation: 4,
        backgroundColor: const Color(0xFF1B4332),
        shape: const CircleBorder(),
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const UploadImagePage())),
        child:
            const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        height: 70,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        color: Colors.white,
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_rounded, "Home", 0),
            _buildNavItem(Icons.quiz_rounded, "Q&A", 1),
            const SizedBox(width: 40), // Space for FAB
            _buildNavItem(Icons.agriculture_rounded, "Varieties", 2),
            _buildNavItem(Icons.person_rounded, "Profile", 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () => setState(() => _selectedIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xFF2D6A4F) : Colors.grey.shade400,
            size: 26,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color:
                  isSelected ? const Color(0xFF2D6A4F) : Colors.grey.shade400,
            ),
          )
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Featured Banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF52B788), Color(0xFF1B4332)]),
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF1B4332).withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.auto_awesome,
                        color: Colors.white, size: 20),
                    const SizedBox(width: 8),
                    Text("AI PROTECTION",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2)),
                  ],
                ),
                const SizedBox(height: 12),
                const Text("Detect Disease Instantly",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(
                    "Scan your crops to identify pests and diseases in seconds.",
                    style: TextStyle(
                        color: Colors.white70, fontSize: 14, height: 1.4)),
              ],
            ),
          ),

          const SizedBox(height: 30),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Quick Analysis",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B4332))),
              Text("View all",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF2D6A4F),
                      fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 16),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            child: Row(
              children: [
                _diseaseCard(
                  "Rice Blast",
                  const Color(0xFFFFF1F1),
                  const Color(0xFFE5383B),
                  Icons.bug_report_rounded,
                  () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RiceBlastPage())),
                ),
                const SizedBox(width: 16),
                _diseaseCard(
                  "Sheath Blight",
                  const Color(0xFFF0FFF4),
                  const Color(0xFF2D6A4F),
                  Icons.eco_rounded,
                  () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SheathBlightPage())),
                ),
                const SizedBox(width: 16),
                _diseaseCard(
                  "Brown Spot",
                  const Color(0xFFFFF9F0),
                  const Color(0xFFB07D05),
                  Icons.eco_rounded,
                  () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BrownSpotPage())),
                ),
              ],
            ),
          ),

          const SizedBox(height: 35),
          const Text("Daily Care Tips",
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B4332))),
          const SizedBox(height: 16),

          _modernTipCard("Regular Irrigation", "Morning schedule: 6 AM - 8 AM",
              Icons.water_drop_rounded, Colors.blue),
          _modernTipCard("Organic Feed", "Use nitrogen-rich natural compost",
              Icons.bakery_dining_rounded, Colors.orange),
          _modernTipCard("Optimal Spacing", "Maintain 20cm between saplings",
              Icons.straighten_rounded, Colors.green),

          const SizedBox(height: 110), // Space for FAB
        ],
      ),
    );
  }

  Widget _diseaseCard(
      String title, Color bg, Color accent, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 130,
        width: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 4))
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
              child: Icon(icon, color: accent, size: 28),
            ),
            const SizedBox(height: 12),
            Text(title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B4332))),
          ],
        ),
      ),
    );
  }

  Widget _modernTipCard(
      String title, String subtitle, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 8,
              offset: const Offset(0, 2))
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(14)),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF1B4332))),
                const SizedBox(height: 2),
                Text(subtitle,
                    style:
                        TextStyle(color: Colors.grey.shade500, fontSize: 13)),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios_rounded,
              color: Colors.grey.shade300, size: 16),
        ],
      ),
    );
  }
}
