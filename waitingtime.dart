import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(my());
}

class my extends StatelessWidget {
  const my({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waiting Warriors',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TealBackground(),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WaitingWarriorGame()),
                );
              },
              child: Text('Start Waiting Warriors Game'),
            ),
          ),
        ],
      ),
    );
  }
}

class WaitingWarriorGame extends StatefulWidget {
  const WaitingWarriorGame({super.key});

  @override
  _WaitingWarriorGameState createState() => _WaitingWarriorGameState();
}

class _WaitingWarriorGameState extends State<WaitingWarriorGame> {
  int _start = 10;
  bool _isWaiting = false;
  Timer? _timer;

  final List<String> _activities = [
    "Raise your hands up!!",
    "Tell your name 2 times",
    "Stand up!",
    "Walk around.",
    "5 sit-ups!!",
    "Go eat and come!!",
    "Lift your left hand up",
    "Take a deep breath and pause for a while and continue",
    "Try to balance on one foot.",
    "Close your eyes and imagine a happy place.",
  ];

  void _startWait() {
    setState(() {
      _isWaiting = true;
      _start = 10;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        _timer?.cancel();
        _showReward();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void _resetWait() {
    _timer?.cancel();
    setState(() {
      _start = 10;
      _isWaiting = false;
    });
  }

  void _showReward() {
    String randomActivity = _activities[Random().nextInt(_activities.length)];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("You Did It!"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Congratulations, you've waited patiently! 🎉"),
              SizedBox(height: 20),
              Text(
                "Activity suggestion: $randomActivity",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                _resetWait();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Waiting Warriors Game')),
      body: Stack(
        children: [
          TealBackground(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingCircle(),
                SizedBox(height: 40),
                MovingCloud(),
                SizedBox(height: 20),
                Text(
                  _isWaiting ? 'Time Left: $_start' : "Let's Start Waiting!",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isWaiting ? _resetWait : _startWait,
                  child: Text(_isWaiting ? 'Reset Timer' : 'Start Waiting'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TealBackground extends StatelessWidget {
  const TealBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(color: Colors.teal));
  }
}

class MovingCloud extends StatefulWidget {
  const MovingCloud({super.key});

  @override
  _MovingCloudState createState() => _MovingCloudState();
}

class _MovingCloudState extends State<MovingCloud>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: -100, end: 100).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_animation.value, 0),
          child: Icon(Icons.cloud, size: 100, color: Colors.white70),
        );
      },
    );
  }
}

class FloatingCircle extends StatelessWidget {
  const FloatingCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
    );
  }
}
