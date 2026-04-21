// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:crops_disease/screens/variety/rc_480/480.dart';
import 'package:crops_disease/screens/variety/rc_480/402.dart';
import 'package:crops_disease/screens/variety/rc_480/300.dart';
import 'package:crops_disease/screens/variety/RC_480/216.dart';
import 'package:crops_disease/screens/variety/RC_480/222.dart';
import 'package:crops_disease/screens/variety/RC_480/160.dart';

class VarietyData {
  final String name;
  final String type;
  final String source;
  final String year;

  VarietyData({
    required this.name,
    required this.type,
    required this.source,
    required this.year,
  });
}

class VarietyPage extends StatefulWidget {
  const VarietyPage({super.key});

  @override
  State<VarietyPage> createState() => _VarietyPageState();
}

class _VarietyPageState extends State<VarietyPage> {
  // 1. Original master list
  final List<VarietyData> _varieties = [
    VarietyData(
        name: 'NSIC Rc 480 (GSR 8)',
        type: 'Rainfed Lowland - Inbred',
        source: 'IRRI',
        year: '2016'),
    VarietyData(
        name: 'NSIC Rc 402 (Tubigan 36)',
        type: 'Irrigated Lowland - Inbred',
        source: 'PhilRice',
        year: '2015'),
    VarietyData(
        name: 'NSIC Rc 300 (Tubigan 24)',
        type: 'Irrigated Lowland - Inbred',
        source: 'PhilRice',
        year: '2012'),
    VarietyData(
        name: 'NSIC Rc 216 (Tubigan 17)',
        type: 'Irrigated Lowland - Inbred',
        source: 'PhilRice',
        year: '2009'),
    VarietyData(
        name: 'NSIC Rc 222 (Tubigan 18)',
        type: 'Irrigated Lowland - Inbred',
        source: 'IRRI',
        year: '2009'),
    VarietyData(
        name: 'NSIC Rc 160 (Tubigan 14)',
        type: 'Irrigated Lowland - Inbred',
        source: 'PhilRice',
        year: '2007'),
  ];

  // 2. List that will change based on search
  List<VarietyData> _filteredVarieties = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the filtered list with all varieties
    _filteredVarieties = _varieties;
  }

  // 3. Filtering logic
  void _filterVarieties(String query) {
    setState(() {
      _filteredVarieties = _varieties
          .where((variety) =>
              variety.name.toLowerCase().contains(query.toLowerCase()) ||
              variety.type.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      body: SafeArea(
        child: Column(
          children: [
            // Custom Header
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Rice Varieties",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Top 6 Recommended Varieties",
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 15),

                  // Search Field implementation
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: _filterVarieties, // Trigger filter on typing
                      decoration: InputDecoration(
                        icon: const Icon(Icons.search),
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  _searchController.clear();
                                  _filterVarieties('');
                                },
                              )
                            : null,
                        hintText: "Search variety...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),

            // List Section - use _filteredVarieties here
            Expanded(
              child: _filteredVarieties.isEmpty
                  ? const Center(child: Text("No varieties found"))
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _filteredVarieties.length,
                      itemBuilder: (context, index) {
                        return _VarietyCard(variety: _filteredVarieties[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VarietyCard extends StatelessWidget {
  final VarietyData variety;
  const _VarietyCard({required this.variety});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // ... (Your navigation logic remains the same)
        if (variety.name.contains('480')) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Rc480Page()));
        } else if (variety.name.contains('402')) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Rc402Page()));
        } else if (variety.name.contains('300')) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Rc300Page()));
        } else if (variety.name.contains('216')) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Rc216Page()));
        } else if (variety.name.contains('222')) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Rc222Page()));
        } else if (variety.name.contains('160')) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Rc160Page()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Profile for ${variety.name} coming soon!')),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 4)),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1), shape: BoxShape.circle),
              child: const Icon(Icons.grass, color: Colors.green),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(variety.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 5),
                  Text(variety.type,
                      style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                  const SizedBox(height: 4),
                  Text("${variety.source} • ${variety.year}",
                      style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
