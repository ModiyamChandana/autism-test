import 'package:flutter/material.dart';

void main() {
  runApp(const AlphabetDragDropApp());
}

class AlphabetDragDropApp extends StatelessWidget {
  const AlphabetDragDropApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Alphabet Drag and Drop")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AlphabetDragDropScreen(),
              ),
            );
          },
          child: const Text("Start Game"),
        ),
      ),
    );
  }
}

class AlphabetDragDropScreen extends StatefulWidget {
  const AlphabetDragDropScreen({super.key});

  @override
  _AlphabetDragDropScreenState createState() => _AlphabetDragDropScreenState();
}

class _AlphabetDragDropScreenState extends State<AlphabetDragDropScreen> {
  List<String> alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("");
  List<String> targetAlphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("");
  Map<String, bool> matched = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alphabet Drag and Drop"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          const Text("Drag these letters"),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 13,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: alphabets.length,
              itemBuilder: (context, index) {
                String letter = alphabets[index];
                return Draggable<String>(
                  data: letter,
                  feedback: _buildLetterTile(letter, Colors.blue, 40),
                  childWhenDragging: const SizedBox.shrink(),
                  child: _buildLetterTile(letter, Colors.black, 24),
                );
              },
            ),
          ),
          const Divider(),
          const Text("Match these letters"),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 13,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: targetAlphabets.length,
              itemBuilder: (context, index) {
                String letter = targetAlphabets[index];
                return DragTarget<String>(
                  onAccept: (data) {
                    if (data == letter) {
                      setState(() {
                        matched[letter] = true;
                        alphabets.remove(letter);

                        if (matched.length == targetAlphabets.length) {
                          _showCompletionDialog();
                        }
                      });
                    }
                  },
                  builder: (context, candidateData, rejectedData) {
                    return _buildLetterTile(
                      matched[letter] == true ? letter : letter,
                      matched[letter] == true ? Colors.green : Colors.grey,
                      24,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLetterTile(String letter, Color color, double fontSize) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: color, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        letter,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Congratulations!"),
          content: const Text("You matched all the letters."),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  matched.clear();
                  alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("");
                });
                Navigator.pop(context);
              },
              child: const Text("Play Again"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text("Back to Home"),
            ),
          ],
        );
      },
    );
  }
}
