import 'package:flutter/material.dart';
import 'breathinout.dart';
import '1-9.dart';
import 'a-z.dart';
import 'memory.dart';
import 'scribling.dart';
import 'waitingtime.dart';
import 'stepbystep.dart';
import 'fruitninja.dart';
import 'expressions.dart';

void main() {
  runApp(GlowLightApp());
}

class GlowLightApp extends StatelessWidget {
  const GlowLightApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ActivitiesScreen(),
    );
  }
}

class ActivitiesScreen extends StatelessWidget {
  ActivitiesScreen({super.key});

  final List<Map<String, dynamic>> activities = [
    {
      "title": "Breathing In-Out 🧘‍♂️",
      "icon": Icons.air,
      "screen": GlowScreen(),
      "color": Color(0xFFE3F2FD),
    },
    {
      "title": "1-9 🔢",
      "icon": Icons.looks_one,
      "screen": NumberDragDropApp(),
      "color": Color(0xFFFFF3E0),
    },
    {
      "title": "A-Z 🔠",
      "icon": Icons.abc,
      "screen": AlphabetDragDropApp(),
      "color": Color(0xFFE8F5E9),
    },
    {
      "title": "Memory 🧠",
      "icon": Icons.memory,
      "screen": MemoryGameApp(),
      "color": Color(0xFFF3E5F5),
    },
    {
      "title": "Scribbling 🎨",
      "icon": Icons.brush,
      "screen": DigitalFingerApp(),
      "color": Color(0xFFFFEBEE),
    },
    {
      "title": "Waiting Time ⏳",
      "icon": Icons.hourglass_bottom,
      "screen": my(),
      "color": Color(0xFFE0F7FA),
    },
    {
      "title": "Step-by-Step 🚶‍♂️",
      "icon": Icons.directions_walk,
      "screen": HousekeepingApp(),
      "color": Color(0xFFFFF9C4),
    },
    {
      "title": "Fruit Ninja 🍉",
      "icon": Icons.sports_esports,
      "screen": MyApp(),
      "color": Color(0xFFFBE9E7),
    },
    {
      "title": "Expressions 😊",
      "icon": Icons.face,
      "screen": AnimatedCreature(),
      "color": Color(0xFFD7CCC8),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: activities.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: activities[index]["color"],
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: Icon(
                      activities[index]["icon"],
                      size: 30,
                      color: Colors.black54,
                    ),
                    title: Center(
                      child: Text(
                        activities[index]["title"],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    trailing: const SizedBox(width: 30),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  ActivityScreen(activity: activities[index]),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ActivityScreen extends StatelessWidget {
  final Map<String, dynamic> activity;

  const ActivityScreen({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(activity["title"]),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(child: activity["screen"]),
    );
  }
}
