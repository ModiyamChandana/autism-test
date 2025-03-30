import 'package:flutter/material.dart';

void main() {
  runApp(NumberDragDropApp());
}

class NumberDragDropApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Number Drag and Drop Game")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NumberDragDropScreen()),
            );
          },
          child: Text("Start Game"),
        ),
      ),
    );
  }
}

class NumberDragDropScreen extends StatefulWidget {
  @override
  _NumberDragDropScreenState createState() => _NumberDragDropScreenState();
}

class _NumberDragDropScreenState extends State<NumberDragDropScreen> {
  List<String> numbers = List.generate(10, (index) => index.toString());
  List<String> targetNumbers = List.generate(10, (index) => index.toString());
  Map<String, bool> matched = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Number Drag and Drop"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Text("Drag these numbers"),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: numbers.length,
              itemBuilder: (context, index) {
                String number = numbers[index];
                return Draggable<String>(
                  data: number,
                  feedback: _buildTile(number, Colors.blue, 40),
                  childWhenDragging: SizedBox.shrink(),
                  child: _buildTile(number, Colors.black, 24),
                );
              },
            ),
          ),
          Divider(),
          Text("Match these numbers"),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: targetNumbers.length,
              itemBuilder: (context, index) {
                String number = targetNumbers[index];
                return DragTarget<String>(
                  onAccept: (data) {
                    if (data == number) {
                      setState(() {
                        matched[number] = true;
                        numbers.remove(number);
                        if (matched.length == targetNumbers.length) {
                          _showCompletionDialog();
                        }
                      });
                    }
                  },
                  builder: (context, candidateData, rejectedData) {
                    return _buildTile(
                      matched[number] == true ? number : number,
                      matched[number] == true ? Color(0xff3d13d5) : Colors.grey,
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

  Widget _buildTile(String text, Color color, double fontSize) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: color, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
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
          title: Text("Congratulations!"),
          content: Text("You matched all the numbers."),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  matched.clear();
                  numbers = List.generate(10, (index) => index.toString());
                });
                Navigator.pop(context);
              },
              child: Text("Play Again"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text("Back to Home"),
            ),
          ],
        );
      },
    );
  }
}
