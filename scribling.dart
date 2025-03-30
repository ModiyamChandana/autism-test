import 'package:flutter/material.dart';

void main() {
  runApp(DigitalFingerApp());
}

class DigitalFingerApp extends StatelessWidget {
  const DigitalFingerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(), // Set HomeScreen as the initial page
    );
  }
}

// Home Screen with a button to navigate to the drawing page
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome to Digital Finger Drawing')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DigitalFingerPage()),
            );
          },
          child: Text('Start Drawing'),
        ),
      ),
    );
  }
}

class DigitalFingerPage extends StatefulWidget {
  const DigitalFingerPage({super.key});

  @override
  _DigitalFingerPageState createState() => _DigitalFingerPageState();
}

class _DigitalFingerPageState extends State<DigitalFingerPage> {
  List<Map<String, dynamic>> points = [];
  bool isErasing = false;
  Color selectedColor = Colors.blue;
  double strokeWidth = 10.0;

  void _clearCanvas() {
    setState(() {
      points.clear();
    });
  }

  void _toggleEraser() {
    setState(() {
      isErasing = !isErasing;
    });
  }

  void _changeColor(Color color) {
    setState(() {
      selectedColor = color;
      isErasing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Digital Finger Drawing'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to HomeScreen
          },
        ),
        actions: [
          IconButton(icon: Icon(Icons.clear), onPressed: _clearCanvas),
          IconButton(
            icon: Icon(isErasing ? Icons.brush : Icons.cleaning_services),
            onPressed: _toggleEraser,
          ),
        ],
      ),
      body: Stack(
        children: [
          GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                points.add({
                  'offset': details.localPosition,
                  'color': isErasing ? Colors.white : selectedColor,
                  'strokeWidth': strokeWidth,
                });
              });
            },
            onPanEnd: (details) {
              setState(() {
                points.add({
                  'offset': null,
                  'color': selectedColor,
                  'strokeWidth': strokeWidth,
                });
              });
            },
            child: CustomPaint(
              painter: FingerPainter(points),
              size: Size.infinite,
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  onPressed: _toggleEraser,
                  child: Icon(
                    isErasing ? Icons.brush : Icons.cleaning_services,
                  ),
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  onPressed: _clearCanvas,
                  child: Icon(Icons.clear),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildColorButton(Colors.red),
                    _buildColorButton(Colors.green),
                    _buildColorButton(Colors.blue),
                    _buildColorButton(Colors.black),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorButton(Color color) {
    return GestureDetector(
      onTap: () => _changeColor(color),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: Colors.white),
        ),
      ),
    );
  }
}

class FingerPainter extends CustomPainter {
  final List<Map<String, dynamic>> points;

  FingerPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i]['offset'] != null && points[i + 1]['offset'] != null) {
        Paint paint =
            Paint()
              ..color = points[i]['color']
              ..strokeCap = StrokeCap.round
              ..strokeWidth = points[i]['strokeWidth'];

        canvas.drawLine(points[i]['offset'], points[i + 1]['offset'], paint);
      }
    }
  }

  @override
  bool shouldRepaint(FingerPainter oldDelegate) {
    return oldDelegate.points != points;
  }
}
