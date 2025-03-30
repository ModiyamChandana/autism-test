import 'package:flutter/material.dart';

void main() {
  runApp(GlowLightApp());
}

class GlowLightApp extends StatelessWidget {
  const GlowLightApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(), // Set HomeScreen as the initial screen
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Glow Light App')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GlowScreen()),
            );
          },
          child: Text('Start Breathing Exercise'),
        ),
      ),
    );
  }
}

class GlowScreen extends StatefulWidget {
  const GlowScreen({super.key});

  @override
  _GlowScreenState createState() => _GlowScreenState();
}

class _GlowScreenState extends State<GlowScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _breathController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _breathController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 8),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.2).animate(
      CurvedAnimation(parent: _breathController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _breathController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Breathing Exercise'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the HomeScreen
          },
        ),
      ),
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _breathController,
            builder: (context, child) {
              return Positioned.fill(
                child: CustomPaint(
                  painter:
                      _breathController.status == AnimationStatus.forward
                          ? DaySkyWithBirdsPainter()
                          : HalfMoonNightPainter(),
                ),
              );
            },
          ),
          Center(
            child: AnimatedBuilder(
              animation: _breathController,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blueAccent.withOpacity(0.6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueAccent.withOpacity(0.8),
                          blurRadius: 30,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        _breathController.status == AnimationStatus.forward
                            ? "Breathe In"
                            : "Breathe Out",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DaySkyWithBirdsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint skyPaint = Paint()..color = Colors.lightBlueAccent;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), skyPaint);

    Paint sunPaint = Paint()..color = Colors.yellow;
    canvas.drawCircle(
      Offset(size.width * 0.85, size.height * 0.15),
      50,
      sunPaint,
    );

    Paint grassPaint = Paint()..color = Colors.green;
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.8, size.width, size.height * 0.2),
      grassPaint,
    );

    Paint birdPaint =
        Paint()
          ..color = Colors.black
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke;

    List<Offset> birdPositions = [
      Offset(size.width * 0.2, size.height * 0.3),
      Offset(size.width * 0.3, size.height * 0.25),
      Offset(size.width * 0.4, size.height * 0.35),
      Offset(size.width * 0.6, size.height * 0.3),
      Offset(size.width * 0.75, size.height * 0.2),
    ];

    for (var pos in birdPositions) {
      Path birdPath = Path();
      birdPath.moveTo(pos.dx, pos.dy);
      birdPath.relativeQuadraticBezierTo(5, -10, 10, 0);
      birdPath.relativeQuadraticBezierTo(5, 10, 10, 0);
      canvas.drawPath(birdPath, birdPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class HalfMoonNightPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint skyPaint =
        Paint()
          ..shader = LinearGradient(
            colors: [Colors.deepPurple, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), skyPaint);

    Paint moonPaint = Paint()..color = Colors.yellow.withOpacity(0.8);
    Offset moonCenter = Offset(size.width * 0.8, size.height * 0.2);
    double moonRadius = 40;
    canvas.drawCircle(moonCenter, moonRadius, moonPaint);

    Paint shadowPaint = Paint()..color = Colors.deepPurple;
    canvas.drawCircle(
      Offset(moonCenter.dx - 20, moonCenter.dy),
      moonRadius,
      shadowPaint,
    );

    Paint starPaint = Paint()..color = Colors.white;
    List<Offset> stars = [
      Offset(size.width * 0.2, size.height * 0.2),
      Offset(size.width * 0.4, size.height * 0.1),
      Offset(size.width * 0.6, size.height * 0.3),
      Offset(size.width * 0.8, size.height * 0.4),
      Offset(size.width * 0.3, size.height * 0.5),
    ];

    for (var star in stars) {
      canvas.drawCircle(star, 3, starPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
