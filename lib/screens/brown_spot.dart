import 'package:flutter/material.dart';

class BrownSpotPage extends StatelessWidget {
  const BrownSpotPage({super.key});

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
                "Brown Spot (Magnaporthe oryzae)",
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
                "Brown Spot is a fungal disease that usually indicates a nutritional imbalance in the soil. "
                "It is characterized by circular to oval, dark brown lesions on the rice leaves. "
                "In severe cases, these spots can coalesce, causing the leaf to dry out and reducing the plant's ability to photosynthesize.",
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
                  Image.asset("assets/images/spot0.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/spot1.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/spot2.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/spot3.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/spot4.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/spot5.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/spot6.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/spot7.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/spot8.jpeg", fit: BoxFit.cover),
                  Image.asset("assets/images/spot9.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/spot10.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/spot11.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/spot12.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/spot13.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/spot14.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/spot15.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/spot16.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/spot17.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/spot18.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/spot19.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/spot20.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/spot21.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/spot22.jpg", fit: BoxFit.cover),
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
                "• Apply Potassium (Potash) and Nitrogen fertilizers.\n"
                "• Ensure proper drainage to avoid high humidity.\n"
                "• Use disease-free certified seeds.\n"
                "• Monitor soil for Manganese deficiency.",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
