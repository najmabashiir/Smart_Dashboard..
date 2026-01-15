import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Najma Bashiir Ali",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "C1220401",
              style: TextStyle(fontSize: 14),
            ),
            Text(
              "CA227",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          _buildStaticWidget(
            title: 'Student Registration',
            description: 'Registration closes on Friday',
            icon: Icons.person_add,
          ),
          _buildStaticWidget(
            title: 'Exam Schedule',
            description: 'Final Exam starts soon',
            icon: Icons.calendar_month,
          ),
          _buildStaticWidget(
            title: 'Library Notice',
            description: 'Library opens until 08:00 PM',
            icon: Icons.info,
          ),
        ],
      ),
    );
  }

  Widget _buildStaticWidget({
    required String title,
    required String description,
    required IconData icon,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(description),
    );
  }
}
