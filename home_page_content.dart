import 'package:flutter/material.dart';
import 'activties.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Activities",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                ActivityCard(title: "Breathing In-Out"),
                ActivityCard(title: "1-9"),
                ActivityCard(title: "A-Z"),
                ActivityCard(title: "Memory"),
                ActivityCard(title: "Scribbling"),
                ActivityCard(title: "Waiting Time"),
                ActivityCard(title: "Step-by-Step"),
                ActivityCard(title: "Fruit Ninja"),
                ActivityCard(title: "Expressions"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final String title;
  const ActivityCard({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ActivitiesScreen()),
          );
        },
      ),
    );
  }
}
