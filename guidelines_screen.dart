import 'package:flutter/material.dart';

class GuidelinesScreen extends StatelessWidget {
  static const List<Map<String, dynamic>> guidelines = [
    {
      "title": "Clear Communication",
      "icon": Icons.chat_bubble_outline,
      "points": [
        "✔ Use simple words",
        "✔ Avoid confusing phrases",
        "✔ Use pictures to explain things",
      ],
    },
    {
      "title": "Comfortable Environment",
      "icon": Icons.light_mode,
      "points": [
        "✔ Reduce bright lights and loud sounds",
        "✔ Use calm colors and clear fonts",
        "✔ Allow people to adjust settings",
      ],
    },
    {
      "title": "Easy Navigation",
      "icon": Icons.directions,
      "points": [
        "✔ Show step-by-step instructions",
        "✔ Use big buttons and clear menus",
        "✔ Keep the website simple and organized",
      ],
    },
    {
      "title": "Accessibility",
      "icon": Icons.accessibility_new,
      "points": [
        "✔ Support screen readers",
        "✔ Add text for images",
        "✔ Include captions for videos",
      ],
    },
    {
      "title": "Social Interaction",
      "icon": Icons.people_alt_outlined,
      "points": [
        "✔ Offer text chat, not just calls",
        "✔ Give extra time to reply",
        "✔ Explain what to expect in conversations",
      ],
    },
    {
      "title": "Emotional Support",
      "icon": Icons.self_improvement,
      "points": [
        "✔ Give break time if needed",
        "✔ Offer calm and relaxing resources",
        "✔ Link to helpful communities",
      ],
    },
  ];

  const GuidelinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guidelines for Autism Support'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: guidelines.length,
          itemBuilder: (context, index) {
            return _buildGuidelineCard(guidelines[index]);
          },
        ),
      ),
    );
  }

  Widget _buildGuidelineCard(Map<String, dynamic> guideline) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      child: ExpansionTile(
        leading: Icon(guideline["icon"], color: Colors.blueAccent, size: 30),
        title: Text(
          guideline["title"],
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                guideline["points"].length,
                (i) => Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    guideline["points"][i],
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
