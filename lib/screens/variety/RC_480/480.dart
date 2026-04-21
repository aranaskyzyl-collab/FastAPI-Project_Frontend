// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF86BC4C);
  static const Color background = Color(0xFFF5F7FA);
  static const Color cardBg = Colors.white;

  // Status Colors
  static const Color resistant = Color(0xFF2ECC71);
  static const Color intermediate = Color(0xFFF39C12);
  static const Color susceptible = Color(0xFFE74C3C);
}

class ResistanceItem {
  final String title;
  final String imagePath;
  final int resistanceLevel;

  ResistanceItem({
    required this.title,
    required this.imagePath,
    required this.resistanceLevel,
  });
}

class Rc480Page extends StatelessWidget {
  final List<ResistanceItem> diseaseItems = [
    ResistanceItem(
      title: 'Blast',
      imagePath: 'assets/images/diseases/blast2.jpg',
      resistanceLevel: 1,
    ),
    ResistanceItem(
      title: 'Bacterial Leaf Blight',
      imagePath: 'assets/images/diseases/blight.jpg',
      resistanceLevel: 0,
    ),
    ResistanceItem(
      title: 'Tungro',
      imagePath: 'assets/images/diseases/tungro.jpg',
      resistanceLevel: 0,
    ),
    ResistanceItem(
      title: 'Sheath Blight',
      imagePath: 'assets/images/diseases/sheath.jpg',
      resistanceLevel: 0,
    ),
  ];

  final List<ResistanceItem> insectItems = [
    ResistanceItem(
      title: 'Brown Plant Hopper',
      imagePath: 'assets/images/insects/brown.jpg',
      resistanceLevel: 1,
    ),
    ResistanceItem(
      title: 'Green Leaf Hopper',
      imagePath: 'assets/images/insects/green.jpg',
      resistanceLevel: 1,
    ),
    ResistanceItem(
      title: 'Yellow Stem Borer',
      imagePath: 'assets/images/insects/yellow.jpg',
      resistanceLevel: 0,
    ),
  ];

  Rc480Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'NSIC Rc 480 Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection('Disease Resistance', Icons.biotech_rounded),
            const SizedBox(height: 16),
            ...diseaseItems.map((item) => _buildResistanceCard(item)),
            const SizedBox(height: 32),
            _buildHeaderSection('Insect Resistance', Icons.bug_report_rounded),
            const SizedBox(height: 16),
            ...insectItems.map((item) => _buildResistanceCard(item)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection(String title, IconData icon) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: AppColors.primary, size: 24),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Color(0xFF2D3436),
          ),
        ),
      ],
    );
  }

  Widget _buildResistanceCard(ResistanceItem item) {
    Color statusColor;
    String label;
    int filledShields;

    // Logic for dynamic styling
    if (item.resistanceLevel == 2) {
      statusColor = AppColors.resistant;
      label = 'Resistant';
      filledShields = 4;
    } else if (item.resistanceLevel == 1) {
      statusColor = AppColors.intermediate;
      label = 'Intermediate';
      filledShields = 2;
    } else {
      statusColor = AppColors.susceptible;
      label = 'Susceptible';
      filledShields = 1;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // Left Side: Status Color Accent
            Container(
              width: 5,
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
            ),

            // Middle: Image
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  item.imagePath,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 80,
                    height: 80,
                    color: Colors.grey[200],
                    child: const Icon(
                      Icons.image_not_supported,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),

            // Right: Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D3436),
                      ),
                    ),
                    const SizedBox(height: 6),
                    _buildShields(filledShields, statusColor),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        label,
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShields(int count, Color color) {
    return Row(
      children: List.generate(4, (index) {
        return Icon(
          index < count ? Icons.shield : Icons.shield_outlined,
          size: 14,
          color: index < count ? color : Colors.grey[300],
        );
      }),
    );
  }
}
