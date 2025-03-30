import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.lightBlue[50]),
      home: FruitNinjaHomePage(),
    );
  }
}

class FruitNinjaHomePage extends StatelessWidget {
  const FruitNinjaHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fruit Ninja'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select Game Duration:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 15),
            _buildGameButton(context, '30 Seconds', 30, Colors.orangeAccent),
            SizedBox(height: 10),
            _buildGameButton(context, '60 Seconds', 60, Colors.greenAccent),
          ],
        ),
      ),
    );
  }

  Widget _buildGameButton(
    BuildContext context,
    String text,
    int duration,
    Color color,
  ) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FruitNinjaGamePage(duration: duration),
          ),
        );
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class FruitNinjaGamePage extends StatefulWidget {
  final int duration;

  const FruitNinjaGamePage({super.key, required this.duration});

  @override
  _FruitNinjaGamePageState createState() => _FruitNinjaGamePageState();
}

class _FruitNinjaGamePageState extends State<FruitNinjaGamePage> {
  final List<Fruit> _fruits = [];
  int _score = 0;
  late Timer _gameTimer;
  late Timer _spawnTimer;
  bool _gameOver = false;

  @override
  void initState() {
    super.initState();
    _startGame();
  }

  void _startGame() {
    _spawnTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!_gameOver) {
        setState(() {
          _fruits.add(Fruit());
        });
      }
    });

    _gameTimer = Timer(Duration(seconds: widget.duration), () {
      setState(() {
        _gameOver = true;
      });
      _spawnTimer.cancel();
      _showGameOverDialog();
    });
  }

  void _showGameOverDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Colors.blue[50],
            title: Center(
              child: Text(
                '🎉 Game Over! 🎉',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Your Score:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text(
                  '$_score ⭐',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text(
                    '🏠 Back to Home',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
    );
  }

  void _sliceFruit(Fruit fruit) {
    if (!_gameOver) {
      setState(() {
        _fruits.remove(fruit);
        _score += 10;
      });
    }
  }

  @override
  void dispose() {
    _gameTimer.cancel();
    _spawnTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Score: $_score'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Stack(
        children:
            _fruits.map((fruit) {
              return Positioned(
                left: fruit.position.dx,
                top: fruit.position.dy,
                child: GestureDetector(
                  onTap: () {
                    _sliceFruit(fruit);
                  },
                  child: Icon(
                    fruit.getShapeIcon(),
                    size: 50,
                    color: fruit.getColor(),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}

class Fruit {
  final Offset position;
  final int shapeType;

  Fruit()
    : position = Offset(
        Random().nextDouble() * 300,
        Random().nextDouble() * 500,
      ),
      shapeType = Random().nextInt(3);

  IconData getShapeIcon() {
    switch (shapeType) {
      case 0:
        return Icons.star; // Star
      case 1:
        return Icons.cake; // Chocolate (cake icon)
      case 2:
        return Icons.icecream; // Lollipop (ice cream icon as an alternative)
      default:
        return Icons.circle; // Fallback
    }
  }

  Color getColor() {
    switch (shapeType) {
      case 0:
        return Colors.yellow; // Star
      case 1:
        return Colors.brown; // Chocolate
      case 2:
        return Colors.pink; // Lollipop
      default:
        return Colors.red;
    }
  }
}
