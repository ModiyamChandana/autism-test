import 'package:flutter/material.dart';
import 'awareness_screen.dart';
import 'guidelines_screen.dart';
import 'sos_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('NIRAMAY', style: TextStyle(fontSize: 24))),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'Awareness') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AutismInfoApp()),
                );
              } else if (value == 'Guidelines') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GuidelinesScreen()),
                );
              } else if (value == 'SOS') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstPage()),
                );
              }
            },
            itemBuilder:
                (context) => [
                  PopupMenuItem(value: 'Awareness', child: Text('Awareness')),
                  PopupMenuItem(value: 'Guidelines', child: Text('Guidelines')),
                  PopupMenuItem(value: 'SOS', child: Text('SOS')),
                ],
          ),
        ],
      ),
      body: AutismInfoApp(),
    );
  }
}
