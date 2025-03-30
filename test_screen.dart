import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Autism Severity Test (CARS)',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.teal.shade100,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/test': (context) => AutismTestScreen(),
        '/about': (context) => AboutScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Autism Severity Test')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade200, Colors.teal.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.psychology, size: 80, color: Colors.teal.shade700),
                SizedBox(height: 30),
                Text(
                  'Childhood Autism Rating Scale (CARS)',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'This test helps assess the severity of autism symptoms.',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/test');
                  },
                  child: Text(
                    'Start Test',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/about');
                  },
                  child: Text(
                    'About This Test',
                    style: TextStyle(fontSize: 16, color: Colors.teal.shade800),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade200, Colors.teal.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About the CARS Test',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'The Childhood Autism Rating Scale (CARS) is a behavior rating scale intended to help diagnose autism. This app provides a simplified version for informational purposes only.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Disclaimer',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'This is not a diagnostic tool. Only a qualified professional can diagnose autism spectrum disorder. If you have concerns about autism, please consult with a healthcare provider.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/test');
                    },
                    child: Text(
                      'Start Test Now',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AutismTestScreen extends StatefulWidget {
  const AutismTestScreen({super.key});

  @override
  _AutismTestScreenState createState() => _AutismTestScreenState();
}

class _AutismTestScreenState extends State<AutismTestScreen> {
  int score = 0;
  int questionIndex = 0;
  double resultFontSize = 24.0;
  List<int?> answers = List.filled(15, null); // Updated to 15 for all questions

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Does the person have difficulty making eye contact?',
      'options': [
        '1 (Not a symptom)',
        '2 (Mild)',
        '3 (Moderate)',
        '4 (Severe)',
      ],
    },
    {
      'question': 'Does the person exhibit repetitive body movements?',
      'options': [
        '1 (Not a symptom)',
        '2 (Mild)',
        '3 (Moderate)',
        '4 (Severe)',
      ],
    },
    {
      'question':
          'Does the person show a lack of empathy or difficulty understanding emotions?',
      'options': [
        '1 (Not a symptom)',
        '2 (Mild)',
        '3 (Moderate)',
        '4 (Severe)',
      ],
    },
    {
      'question':
          'Does the person engage in restricted interests or behaviors?',
      'options': [
        '1 (Not a symptom)',
        '2 (Mild)',
        '3 (Moderate)',
        '4 (Severe)',
      ],
    },
    {
      'question':
          'Does the person struggle with verbal or non-verbal communication?',
      'options': [
        '1 (Not a symptom)',
        '2 (Mild)',
        '3 (Moderate)',
        '4 (Severe)',
      ],
    },
    {
      'question': 'Does the person have difficulty understanding social rules?',
      'options': [
        '1 (Not a symptom)',
        '2 (Mild)',
        '3 (Moderate)',
        '4 (Severe)',
      ],
    },
    {
      'question':
          'Does the person avoid or not respond to social interactions?',
      'options': [
        '1 (Not a symptom)',
        '2 (Mild)',
        '3 (Moderate)',
        '4 (Severe)',
      ],
    },
    {
      'question':
          'Does the person engage in unusual or excessive attachment to objects?',
      'options': [
        '1 (Not a symptom)',
        '2 (Mild)',
        '3 (Moderate)',
        '4 (Severe)',
      ],
    },
    {
      'question':
          'Does the person have difficulties in adjusting to changes in routines?',
      'options': [
        '1 (Not a symptom)',
        '2 (Mild)',
        '3 (Moderate)',
        '4 (Severe)',
      ],
    },
    {
      'question': 'Does the person have extreme sensory sensitivities?',
      'options': [
        '1 (Not a symptom)',
        '2 (Mild)',
        '3 (Moderate)',
        '4 (Severe)',
      ],
    },
    {
      'question':
          'Does the person have delayed speech or language development?',
      'options': [
        '1 (Not a symptom)',
        '2 (Mild)',
        '3 (Moderate)',
        '4 (Severe)',
      ],
    },
    {
      'question':
          'Does the person take figurative language (e.g., jokes, sarcasm) literally?',
      'options': [
        '1 (Not a symptom)',
        '2 (Mild)',
        '3 (Moderate)',
        '4 (Severe)',
      ],
    },
    {
      'question':
          'Does the person show intense focus on specific topics or interests?',
      'options': [
        '1 (Not a symptom)',
        '2 (Mild)',
        '3 (Moderate)',
        '4 (Severe)',
      ],
    },
    {
      'question':
          'Does the person have difficulty with fine or gross motor skills (e.g., handwriting, coordination)?',
      'options': [
        '1 (Not a symptom)',
        '2 (Mild)',
        '3 (Moderate)',
        '4 (Severe)',
      ],
    },
    {
      'question':
          'Does the person exhibit echolalia (repeating words/phrases without context)?',
      'options': [
        '1 (Not a symptom)',
        '2 (Mild)',
        '3 (Moderate)',
        '4 (Severe)',
      ],
    },
  ];

  void answerQuestion(String answer) {
    int pointValue = int.parse(answer[0]);
    setState(() {
      answers[questionIndex] = pointValue;
      score = answers.fold(0, (sum, item) => sum + (item ?? 0));
      questionIndex++;
    });
  }

  String calculateSeverity() {
    double averageScore = score / questions.length;
    if (averageScore <= 1.5) return 'No Symptoms or Mild Symptoms';
    if (averageScore <= 2.5) return 'Moderate Symptoms';
    return 'Severe Symptoms';
  }

  @override
  Widget build(BuildContext context) {
    if (questionIndex >= questions.length) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Test Complete'),
          leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/',
                (Route<dynamic> route) => false,
              );
            },
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal.shade200, Colors.teal.shade100],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Test Completed!',
                    style: TextStyle(
                      fontSize: resultFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Your Severity Level: ${calculateSeverity()}',
                    style: TextStyle(
                      fontSize: resultFontSize + 6,
                      color: Colors.teal.shade800,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        score = 0;
                        questionIndex = 0;
                        answers = List.filled(15, null); // Updated to 15
                      });
                    },
                    child: Text(
                      'Restart Test',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/',
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: Text(
                      'Return to Home',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.teal.shade800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Question ${questionIndex + 1}/${questions.length}'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              if (questionIndex > 0) {
                setState(() {
                  questionIndex--;
                });
              } else {
                Navigator.pop(context);
              }
            },
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal.shade200, Colors.teal.shade100],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      questions[questionIndex]['question'],
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ...questions[questionIndex]['options'].map<Widget>((option) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            answers[questionIndex] == int.parse(option[0])
                                ? Colors.teal.shade800
                                : Colors.teal.shade600,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => answerQuestion(option),
                      child: Text(
                        option,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      );
    }
  }
}
