import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: HomeScreen(), debugShowCheckedModeBanner: false));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AnimatedCreature()),
            );
          },
          child: Text("Start Animation"),
        ),
      ),
    );
  }
}

class AnimatedCreature extends StatefulWidget {
  const AnimatedCreature({super.key});

  @override
  _AnimatedCreatureState createState() => _AnimatedCreatureState();
}

class _AnimatedCreatureState extends State<AnimatedCreature> {
  String expression = 'happy';

  void changeExpression(String newExpression) {
    setState(() {
      expression = newExpression;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Creature"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: CustomPaint(painter: CreaturePainter(expression)),
            ),
          ),
          SizedBox(height: 30),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => changeExpression('happy'),
                child: Text("Happy", style: TextStyle(fontSize: 20)),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => changeExpression('sad'),
                child: Text("Sad", style: TextStyle(fontSize: 20)),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => changeExpression('angry'),
                child: Text("Angry", style: TextStyle(fontSize: 20)),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => changeExpression('fear'),
                child: Text("Fear", style: TextStyle(fontSize: 20)),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => changeExpression('surprise'),
                child: Text("Surprise", style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CreaturePainter extends CustomPainter {
  final String expression;

  CreaturePainter(this.expression);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.orange;
    final eyePaint = Paint()..color = Colors.black;
    final mouthPaint =
        Paint()
          ..color = Colors.black
          ..strokeWidth = 4
          ..style = PaintingStyle.stroke;

    canvas.drawOval(Rect.fromLTWH(20, 20, 160, 160), paint);
    canvas.drawCircle(Offset(60, 80), 10, eyePaint);
    canvas.drawCircle(Offset(140, 80), 10, eyePaint);

    Path mouthPath = Path();
    if (expression == 'happy') {
      mouthPath.moveTo(70, 130);
      mouthPath.quadraticBezierTo(100, 160, 130, 130);
    } else if (expression == 'sad') {
      mouthPath.moveTo(70, 140);
      mouthPath.quadraticBezierTo(100, 110, 130, 140);
    } else if (expression == 'angry') {
      mouthPath.moveTo(70, 120);
      mouthPath.lineTo(130, 120);
    } else if (expression == 'fear') {
      mouthPath.moveTo(85, 130);
      mouthPath.quadraticBezierTo(100, 110, 115, 130);
    } else if (expression == 'surprise') {
      mouthPath.addOval(Rect.fromLTWH(90, 120, 20, 20));
    }
    canvas.drawPath(mouthPath, mouthPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
