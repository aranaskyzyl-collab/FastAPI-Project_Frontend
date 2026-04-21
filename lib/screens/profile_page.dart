// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBF9),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Farmer Profile",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            // Profile Header
            const Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: Color(0xFF2D6A4F),
                    child: CircleAvatar(
                      radius: 52,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person,
                          size: 60, color: Color(0xFF2D6A4F)),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text("Farmer Aranas",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text("Lianga, Surigao del Sur",
                      style: TextStyle(color: Colors.grey, fontSize: 14)),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // Farm Stats Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatColumn("2.5 ha", "Farm Size"),
                  _buildStatColumn("14", "Scans"),
                  _buildStatColumn("Healthy", "Status"),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Settings Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  const Text("General Settings",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                  const SizedBox(height: 10),
                  _settingsTile(
                      Icons.person_outline_rounded, "Personal Information"),
                  _settingsTile(
                      Icons.history_edu_rounded, "Disease Scan History"),
                  _settingsTile(
                      Icons.notifications_none_rounded, "Notification Prefs"),
                  _settingsTile(Icons.security_rounded, "Privacy & Security"),
                  const SizedBox(height: 20),
                  const Text("Others",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                  const SizedBox(height: 10),
                  _settingsTile(Icons.help_outline_rounded, "Help Center"),
                  _settingsTile(
                      Icons.info_outline_rounded, "About CropGuard AI"),
                  _settingsTile(Icons.logout_rounded, "Logout", isDelete: true),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String value, String label) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B4332))),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget _settingsTile(IconData icon, String title, {bool isDelete = false}) {
    final color = isDelete ? Colors.red : const Color(0xFF2D6A4F);
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: color, size: 22),
      ),
      title: Text(title,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: isDelete ? Colors.red : Colors.black87)),
      trailing: const Icon(Icons.chevron_right_rounded, color: Colors.grey),
      onTap: () {
        // Handle navigation
      },
    );
  }
}
