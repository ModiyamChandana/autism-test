import 'package:flutter/material.dart';

void main() {
  runApp(AutismInfoApp());
}

class AutismInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Autism Info',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: AutismInfoPage(),
    );
  }
}

class AutismInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Autism Information'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFF9C4), // Soft Yellow
              Color(0xFF80CBC4), // Muted Teal
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildCardSection(
                  'What is Autism?',
                  "Autism, or Autism Spectrum Disorder (ASD), is a condition that affects how people communicate, interact, and behave. It is called a 'spectrum' because it varies in severity.",
                ),
                SizedBox(height: 20),
                buildCardSection(
                  'Reasons for Autism',
                  "Some possible reasons include:\n\n- *Genes:* Autism can run in families.\n- *Pregnancy Factors:* Issues during pregnancy may increase risk.\n- *Brain Differences:* Structural brain changes may contribute.",
                ),
                SizedBox(height: 20),
                buildCardSection(
                  'Identifying Autism',
                  "Early signs include:\n\n- *Delayed speech\n- **Repetitive behaviors* (rocking, flapping hands)\n- *Sensitivity to sounds and lights\n- **Strong preference for routines*",
                ),
                SizedBox(height: 20),
                buildCardSection(
                  'Types of Autism',
                  "Autism types include:\n\n- *Asperger’s Syndrome* – Mild, with social difficulties.\n- *Classic Autism* – More severe speech delays.\n- *PDD-NOS* – Some autism signs but not fully fitting other types.\n- *CDD* – Rare condition where skills are lost after early childhood.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCardSection(String title, String content) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3F51B5), // Indigo Color
              ),
            ),
            SizedBox(height: 8),
            Text(content, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
