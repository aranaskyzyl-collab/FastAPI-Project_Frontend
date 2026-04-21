import 'package:flutter/material.dart';

class SheathBlightPage extends StatelessWidget {
  const SheathBlightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sheath Blight"),
        backgroundColor: Colors.red.shade400,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Disease Image
              Image.asset(
                "assets/images/blight.jpg", // ensure image exists
                height: 250,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),

              // Disease Name
              const Text(
                "Sheath Blight (Rhizoctonia solani)",
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
                "Sheath Blight is a common fungal disease of rice caused by "
                "Rhizoctonia solani. It primarily affects the leaf sheath near "
                "the waterline, producing oval or irregular greenish-gray lesions. "
                "As the disease progresses, lesions spread to leaves, weaken the plant, "
                "and reduce grain quality and yield, especially under warm and humid conditions.",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),

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
                  Image.asset("assets/images/blight1.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blight2.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blight3.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blight4.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blight5.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blight6.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blight7.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blight8.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blight9.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blight10.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blight11.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blight12.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blight.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blight14.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blight15.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blight16.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blight17.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blight18.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blight19.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blight20.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/blight21.jpg", fit: BoxFit.cover),
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
                "• Use resistant or tolerant rice varieties\n"
                "• Maintain proper plant spacing\n"
                "• Avoid excessive nitrogen fertilizer\n"
                "• Improve field drainage\n"
                "• Apply recommended fungicides when needed",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
