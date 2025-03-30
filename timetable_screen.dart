import 'package:flutter/material.dart';

void main() {
  runApp(AutismTimetableApp());
}

class AutismTimetableApp extends StatelessWidget {
  const AutismTimetableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Autism Weekly Timetable',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TimetableScreen(),
    );
  }
}

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});

  @override
  _TimetableScreenState createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  String selectedSeverity = 'mild';
  List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  Map<String, List<String>> activities = {
    'mild': [
      'Breath in Breath out',
      'Essential Activities',
      'Game',
      'Memory Game',
      'Fruit Ninja',
      'Expression Teaching',
    ],
    'moderate': [
      'Breath in Breath out',
      'Alphabets Teaching',
      'Number Teaching',
      'Memory Game',
      'Expressions Teaching',
      'Waiting Time Game',
    ],
    'severe': [
      'Breath in Breath out',
      'Memory Based Game',
      'Scribble Game',
      'Expressions Teaching',
      'Waiting Game',
    ],
  };

  Map<String, Map<String, String>> weeklyTimetable = {};

  @override
  void initState() {
    super.initState();
    for (String day in daysOfWeek) {
      weeklyTimetable[day] = {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Autism-Friendly Weekly Timetable')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Severity Level:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: selectedSeverity,
              onChanged: (String? newValue) {
                setState(() {
                  selectedSeverity = newValue!;
                  weeklyTimetable.clear();
                  for (String day in daysOfWeek) {
                    weeklyTimetable[day] = {};
                  }
                });
              },
              items:
                  activities.keys.map<DropdownMenuItem<String>>((String key) {
                    return DropdownMenuItem<String>(
                      value: key,
                      child: Text(key.toUpperCase()),
                    );
                  }).toList(),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: daysOfWeek.length,
                itemBuilder: (context, dayIndex) {
                  String day = daysOfWeek[dayIndex];
                  return ExpansionTile(
                    title: Text(
                      day,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    children:
                        activities[selectedSeverity]!.map((activity) {
                          return ListTile(
                            title: Text(activity),
                            subtitle: Text(
                              weeklyTimetable[day]![activity] ??
                                  'Tap to set time',
                            ),
                            onTap: () async {
                              TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (pickedTime != null) {
                                setState(() {
                                  weeklyTimetable[day]![activity] = pickedTime
                                      .format(context);
                                });
                              }
                            },
                          );
                        }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
