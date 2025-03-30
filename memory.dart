import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(MemoryGameApp());
}

class MemoryGameApp extends StatelessWidget {
  const MemoryGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memory Matching Game',
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Game Menu')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MemoryGameScreen()),
            );
          },
          child: Text('Play Memory Game'),
        ),
      ),
    );
  }
}

class MemoryGameScreen extends StatefulWidget {
  const MemoryGameScreen({super.key});

  @override
  _MemoryGameScreenState createState() => _MemoryGameScreenState();
}

class _MemoryGameScreenState extends State<MemoryGameScreen> {
  List<String> images = [
    '🍎',
    '🍌',
    '🍇',
    '🍉',
    '🥕',
    '🌽',
    '🍓',
    '🍊',
    '🍎',
    '🍌',
    '🍇',
    '🍉',
    '🥕',
    '🌽',
    '🍓',
    '🍊',
  ];
  late List<bool> flipped;
  late List<bool> matched;
  int? firstIndex, secondIndex;
  bool isProcessing = false;

  @override
  void initState() {
    super.initState();
    images.shuffle(Random());
    flipped = List.generate(images.length, (index) => false);
    matched = List.generate(images.length, (index) => false);
  }

  void onCardTap(int index) {
    if (isProcessing || flipped[index] || matched[index]) return;
    setState(() {
      flipped[index] = true;
    });

    if (firstIndex == null) {
      firstIndex = index;
    } else {
      secondIndex = index;
      isProcessing = true;
      Timer(Duration(seconds: 1), checkMatch);
    }
  }

  void checkMatch() {
    if (images[firstIndex!] == images[secondIndex!]) {
      setState(() {
        matched[firstIndex!] = true;
        matched[secondIndex!] = true;
      });
    } else {
      setState(() {
        flipped[firstIndex!] = false;
        flipped[secondIndex!] = false;
      });
    }
    firstIndex = null;
    secondIndex = null;
    isProcessing = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memory Matching Game'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                images.shuffle(Random());
                flipped = List.generate(images.length, (index) => false);
                matched = List.generate(images.length, (index) => false);
                firstIndex = null;
                secondIndex = null;
                isProcessing = false;
              });
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onCardTap(index),
            child: Container(
              decoration: BoxDecoration(
                color: matched[index] ? Colors.green : Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  flipped[index] || matched[index] ? images[index] : '?',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
