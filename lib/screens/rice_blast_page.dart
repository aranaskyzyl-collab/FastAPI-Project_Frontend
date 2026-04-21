import 'package:flutter/material.dart';

class RiceBlastPage extends StatelessWidget {
  const RiceBlastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rice Blast"),
        backgroundColor: Colors.red.shade400,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Main Image
              Image.asset(
                "assets/images/blast.jpg",
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),

              // Disease Name
              const Text(
                "Rice Blast (Magnaporthe oryzae)",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // Description
              const Text(
                "Rice Blast is one of the most destructive diseases of rice. "
                "It causes diamond-shaped lesions on leaves, and can affect nodes, "
                "panicles, and grains, resulting in severe yield loss.",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),

              // Images Section Title
              const Text(
                "Disease Symptoms Images:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              // Grid of Images
              GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Image.asset("assets/images/blast1.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blast2.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blast3.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blast4.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blast5.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blast6.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blast7.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blast8.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blast9.jpeg", fit: BoxFit.cover),
                  Image.asset("assets/images/blast10.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blast11.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blast12.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blast13.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blast14.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blast15.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blast16.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blast17.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blast18.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blast19.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blast20.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blast21.jpg", fit: BoxFit.cover),
                ],
              ),

              const SizedBox(height: 20),

              // Management Tips
              const Text(
                "Management Tips:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "• Use resistant rice varieties\n"
                "• Avoid dense planting\n"
                "• Apply fungicides if necessary\n"
                "• Remove and destroy infected plants",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
