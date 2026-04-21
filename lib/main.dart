// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'dart:ui';
import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rice Detection',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF2D5A27)), // Deep Leaf Green
        useMaterial3: true,
      ),
      home: const GetStartedPage(),
    );
  }
}

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFF1F8E9), // Very light green
                  Color(0xFFDCEDC8), // Light lime
                  Color(0xFFC5E1A5), // Soft leaf green
                ],
              ),
            ),
          ),

          // 2. Subtle Neural Network Pattern (GAT Visual)
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: CustomPaint(painter: NetworkPatternPainter()),
            ),
          ),

          // 3. Main Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: const EdgeInsets.all(40),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(40),
                          border:
                              Border.all(color: Colors.white.withOpacity(0.5)),
                        ),
                        child: const RiceIcon(size: 140),
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),

                  // Modern Title Styling
                  const Text(
                    "Hybrid CNN",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF1B5E20),
                      letterSpacing: -1,
                    ),
                  ),

                  // Secondary Label with a Badge look
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2D5A27),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "GAT ENHANCED",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        letterSpacing: 2,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Identify and manage rice leaf\ndiseases with precision AI.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF33691E),
                      height: 1.4,
                    ),
                  ),

                  const Spacer(flex: 3),

                  // Neo-Brutalist Styled Button
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1B5E20),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF1B5E20).withOpacity(0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "Start Detection",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ================== CUSTOM RICE ICON (ELEGANT) ==================
class RiceIcon extends StatelessWidget {
  final double size;
  const RiceIcon({super.key, this.size = 140});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(painter: _ElegantRicePainter()),
    );
  }
}

class _ElegantRicePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF1B5E20)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    final centerX = size.width / 2;

    // Curved Stem
    final path = Path();
    path.moveTo(centerX, size.height);
    path.quadraticBezierTo(
        centerX - 40, size.height * 0.5, centerX, size.height * 0.1);
    canvas.drawPath(path, paint);

    // Rice Grains (Fill style)
    final grainPaint = Paint()
      ..color = const Color(0xFF1B5E20)
      ..style = PaintingStyle.fill;

    for (int i = 0; i < 6; i++) {
      double y = size.height * (0.2 + (i * 0.12));
      double xOffset = i % 2 == 0 ? 15 : -15;

      canvas.save();
      canvas.translate(centerX + xOffset, y);
      canvas.rotate(i % 2 == 0 ? 0.5 : -0.5);
      canvas.drawOval(
          Rect.fromCenter(center: Offset.zero, width: 10, height: 18),
          grainPaint);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ================== GAT NETWORK PATTERN ==================
class NetworkPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFF1B5E20);
    final linePaint = Paint()
      ..color = const Color(0xFF1B5E20)
      ..strokeWidth = 1;

    // Static points for the neural network feel
    final points = [
      const Offset(50, 100),
      const Offset(150, 80),
      const Offset(300, 150),
      const Offset(80, 400),
      const Offset(200, 450),
      const Offset(350, 380),
      const Offset(100, 700),
      const Offset(250, 750),
      const Offset(380, 650),
    ];

    for (var i = 0; i < points.length; i++) {
      canvas.drawCircle(points[i], 3, paint);
      for (var j = i + 1; j < points.length; j++) {
        double dist = (points[i] - points[j]).distance;
        if (dist < 200) {
          canvas.drawLine(points[i], points[j], linePaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
