import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/test_screen.dart';
import 'timetable_screen.dart';

class CalendarScreen extends StatelessWidget {
  CalendarScreen({super.key});

  final List<Map<String, dynamic>> options = [
    {
      "title": "Test",
      "icon": Icons.assignment,
      "screen": MyApp(),
    }, // Ensure App() exists
    {
      "title": "Timetable",
      "icon": Icons.calendar_today,
      "screen": TimetableScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calendar')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: options.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(
                  options[index]["icon"],
                  size: 40,
                  color: const Color.fromARGB(255, 238, 236, 236),
                ),
                title: Text(
                  options[index]["title"],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                ), // ✅ FIXED SEMICOLON ERROR
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => options[index]["screen"],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
