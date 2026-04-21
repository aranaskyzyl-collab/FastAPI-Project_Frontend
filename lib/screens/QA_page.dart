// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class QuizQuestion {
  final String question;
  final String category;
  final List<String> options;
  final String correctAnswer;
  String? selectedOption;

  QuizQuestion({
    required this.question,
    required this.category,
    required this.options,
    required this.correctAnswer,
    this.selectedOption,
  });
}

class QAPage extends StatefulWidget {
  const QAPage({super.key});

  @override
  State<QAPage> createState() => _QAPageState();
}

class _QAPageState extends State<QAPage> {
  final List<QuizQuestion> _questions = [
    QuizQuestion(
      category: "Pest Management",
      question:
          "Which insect is known for causing 'hopper burn' in rice fields?",
      options: [
        "A. Stem Borer",
        "B. Brown Plant Hopper",
        "C. Rice Bug",
        "D. Leaf Folder"
      ],
      correctAnswer: "B. Brown Plant Hopper",
    ),
    QuizQuestion(
      category: "Disease",
      question: "What is the primary cause of Rice Blast disease?",
      options: [
        "A. Bacteria",
        "B. Virus",
        "C. Fungus",
        "D. Nutrient Deficiency"
      ],
      correctAnswer: "C. Fungus",
    ),
    QuizQuestion(
      category: "Variety Selection",
      question:
          "Which rice variety is specifically developed for drought-prone rainfed areas?",
      options: [
        "A. NSIC Rc 222",
        "B. IR64",
        "C. NSIC Rc 480 (GSR 8)",
        "D. Jasmine Rice"
      ],
      correctAnswer: "C. NSIC Rc 480 (GSR 8)",
    ),
    QuizQuestion(
      category: "Fertilizer",
      question:
          "What tool is used to determine the Nitrogen needs of a rice crop based on leaf color?",
      options: [
        "A. Soil Sensor",
        "B. LCC (Leaf Color Chart)",
        "C. Moister Meter",
        "D. pH Paper"
      ],
      correctAnswer: "B. LCC (Leaf Color Chart)",
    ),
    QuizQuestion(
      category: "Water Management",
      question:
          "What is the recommended water depth for transplanting rice seedlings?",
      options: ["A. 2-3 cm", "B. 5-10 cm", "C. 15-20 cm", "D. Fully submerged"],
      correctAnswer: "A. 2-3 cm",
    ),
    QuizQuestion(
      category: "Harvesting",
      question:
          "At what percentage of grain maturity should rice typically be harvested?",
      options: ["A. 50-60%", "B. 70-75%", "C. 80-85%", "D. 95-100%"],
      correctAnswer: "C. 80-85%",
    ),
    QuizQuestion(
      category: "Pest Management",
      question:
          "Which pest lays eggs in clusters covered with brown hair on the underside of leaves?",
      options: [
        "A. Golden Apple Snail",
        "B. Rice Stem Borer",
        "C. Green Leafhopper",
        "D. Mole Cricket"
      ],
      correctAnswer: "B. Rice Stem Borer",
    ),
    QuizQuestion(
      category: "Soil Health",
      question: "What is the ideal soil pH for most rice varieties?",
      options: [
        "A. 4.0 - 5.0",
        "B. 6.0 - 7.0",
        "C. 8.0 - 9.0",
        "D. Above 10.0"
      ],
      correctAnswer: "B. 6.0 - 7.0",
    ),
    QuizQuestion(
      category: "Crop Science",
      question:
          "How many days does it usually take for rice seeds to germinate?",
      options: ["A. 1-2 days", "B. 3-5 days", "C. 7-10 days", "D. 14 days"],
      correctAnswer: "B. 3-5 days",
    ),
    QuizQuestion(
      category: "Pest Management",
      question:
          "What is the best way to control the Golden Apple Snail (Kuhol)?",
      options: [
        "A. Heavy fertilization",
        "B. Herbicides",
        "C. Handpicking and herding ducks",
        "D. Increasing water levels"
      ],
      correctAnswer: "C. Handpicking and herding ducks",
    ),
    QuizQuestion(
      category: "Fertilizer",
      question:
          "Which primary nutrient is responsible for the greening of leaves and vegetative growth?",
      options: ["A. Phosphorus", "B. Potassium", "C. Nitrogen", "D. Calcium"],
      correctAnswer: "C. Nitrogen",
    ),
    QuizQuestion(
      category: "Post-Harvest",
      question:
          "What is the safe moisture content for long-term storage of rice grains?",
      options: ["A. 10%", "B. 14%", "C. 18%", "D. 22%"],
      correctAnswer: "B. 14%",
    ),
    QuizQuestion(
      category: "Variety Selection",
      question: "What does 'NSIC' stand for in rice variety naming?",
      options: [
        "A. National Seed Industry Council",
        "B. New Seed International Center",
        "C. National Soil Investigation Committee",
        "D. Natural Seed Integration Club"
      ],
      correctAnswer: "A. National Seed Industry Council",
    ),
    QuizQuestion(
      category: "Disease",
      question:
          "Which disease is characterized by 'burnt-like' orange stripes on leaf tips?",
      options: [
        "A. Tungro",
        "B. Bacterial Leaf Blight",
        "C. Sheath Rot",
        "D. Brown Spot"
      ],
      correctAnswer: "B. Bacterial Leaf Blight",
    ),
    QuizQuestion(
      category: "Seed Quality",
      question:
          "A 'certified seed' bag is usually identified by a tag of what color?",
      options: ["A. White", "B. Red", "C. Blue", "D. Yellow"],
      correctAnswer: "C. Blue",
    ),
    QuizQuestion(
      category: "Disease",
      question: "Tungro disease is transmitted by which insect vector?",
      options: [
        "A. Brown Plant Hopper",
        "B. Green Leafhopper",
        "C. Rice Bug",
        "D. Aphids"
      ],
      correctAnswer: "B. Green Leafhopper",
    ),
    QuizQuestion(
      category: "Land Preparation",
      question: "What is the purpose of 'puddling' the soil before planting?",
      options: [
        "A. To increase soil aeration",
        "B. To reduce water percolation",
        "C. To make the soil harder",
        "D. To encourage weed growth"
      ],
      correctAnswer: "B. To reduce water percolation",
    ),
    QuizQuestion(
      category: "Pest Management",
      question:
          "Which pest feeds on the rice panicle during the milking stage, causing empty grains?",
      options: ["A. Rice Bug", "B. Stem Borer", "C. Leaf Folder", "D. Thrips"],
      correctAnswer: "A. Rice Bug",
    ),
    QuizQuestion(
      category: "Fertilizer",
      question:
          "Which element helps rice plants resist lodging (falling over) and diseases?",
      options: ["A. Iron", "B. Potassium", "C. Zinc", "D. Manganese"],
      correctAnswer: "B. Potassium",
    ),
    QuizQuestion(
      category: "Water Management",
      question: "What is 'AWD' in modern sustainable rice farming?",
      options: [
        "A. Always Water Daily",
        "B. Alternate Wetting and Drying",
        "C. Automatic Water Drainage",
        "D. Agricultural Water Distribution"
      ],
      correctAnswer: "B. Alternate Wetting and Drying",
    ),
  ];

  void _submitQuiz() {
    int score = 0;
    int unanswered = 0;

    for (var question in _questions) {
      if (question.selectedOption == null) {
        unanswered++;
      } else if (question.selectedOption == question.correctAnswer) {
        score++;
      }
    }
    _showScoreDialog(score, _questions.length, unanswered);
  }

  void _showScoreDialog(int score, int total, int unanswered) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text("Quiz Results", textAlign: TextAlign.center),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "$score / $total",
              style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            const SizedBox(height: 10),
            Text("Correct Answers: $score"),
            Text("Incorrect Answers: ${total - score - unanswered}"),
            if (unanswered > 0)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text("$unanswered questions were skipped.",
                    style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 13,
                        fontWeight: FontWeight.w500)),
              ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                for (var q in _questions) {
                  q.selectedOption = null;
                }
              });
              Navigator.pop(context);
            },
            child: const Text("Restart Quiz"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF4CAF50), Color(0xFF2E7D32)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(25)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text("Rice Farming Quiz",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Text("Test your knowledge on 20 farming topics",
                      style: TextStyle(color: Colors.white70, fontSize: 13)),
                ],
              ),
            ),

            // Question List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _questions.length,
                itemBuilder: (context, index) {
                  final item = _questions[index];
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(item.category.toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10)),
                              Text("Q${index + 1}/20",
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 10)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(item.question,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black87)),
                          const SizedBox(height: 12),
                          ...item.options.map((option) => Container(
                                margin: const EdgeInsets.only(bottom: 4),
                                decoration: BoxDecoration(
                                  color: item.selectedOption == option
                                      ? Colors.green.withOpacity(0.1)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: RadioListTile<String>(
                                  title: Text(option,
                                      style: const TextStyle(fontSize: 14)),
                                  value: option,
                                  groupValue: item.selectedOption,
                                  activeColor: Colors.green,
                                  contentPadding: EdgeInsets.zero,
                                  dense: true,
                                  onChanged: (value) {
                                    setState(() => item.selectedOption = value);
                                  },
                                ),
                              )),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Submit Button
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -5))
                ],
              ),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E7D32),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
                  onPressed: _submitQuiz,
                  child: const Text("FINISH & SUBMIT",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
