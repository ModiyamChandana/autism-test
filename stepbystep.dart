import 'package:flutter/material.dart';

void main() {
  runApp(const HousekeepingApp());
}

class HousekeepingApp extends StatelessWidget {
  const HousekeepingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Housekeeping Guide',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, dynamic>> tasks = [
    {
      "title": "Pack a Bag 🎒",
      "steps": [
        "Pick a bag.",
        "Write a list.",
        "Put big things in first.",
        "Add small things.",
        "Check everything again.",
      ],
    },
    {
      "title": "Wash Hands 🧼",
      "steps": [
        "Turn on the tap.",
        "Put soap on your hands.",
        "Rub your hands.",
        "Wash with water.",
        "Dry with a towel.",
      ],
    },
    {
      "title": "Make Your Bed 🛏",
      "steps": [
        "Remove pillows.",
        "Flatten your sheets.",
        "Arrange pillows.",
        "Place blanket neatly.",
      ],
    },
    {
      "title": "Fold Clothes 👕",
      "steps": [
        "Lay clothes flat.",
        "Fold sleeves in.",
        "Fold the bottom.",
        "Arrange them neatly.",
      ],
    },
    {
      "title": "Sweep the Floor 🧹",
      "steps": [
        "Take  broom.",
        "Sweep dirt to one side.",
        "Use dustpan.",
        "Throw dirt.",
      ],
    },
    {
      "title": "Take Out Trash 🗑",
      "steps": [
        "Tie up garbage bag.",
        "Carry outdoor.",
        "Dispose properly.",
        "Replace bag.",
      ],
    },
    {
      "title": "Organize a Shelf 📚",
      "steps": [
        "Remove Mess.",
        "Wipe shelf.",
        "Sort by type or size.",
        "Arrange neatly.",
      ],
    },
    {
      "title": "Do Laundry 🧺",
      "steps": [
        "Sort clothes.",
        "Fill washer.",
        "Add detergent.",
        "Start machine.",
        "Dry clothes.",
      ],
    },
    {
      "title": "Sort Clothes Before Washing 👕",
      "steps": [
        "Separate lights and darks.",
        "Check labels.",
        "Pre-Soak stains.",
        "Fill washer.",
      ],
    },
    {
      "title": "Wash Dishes 🍽",
      "steps": [
        "Remove food present on dishes.",
        "Apply soap.",
        "Clean dishes.",
        "Wash properly.",
        "Dry and store.",
      ],
    },
    {
      "title": "Wipe the Table 🧻",
      "steps": ["Get a weet cloth.", "Wipe in circles.", "Dry with a towel."],
    },
    {
      "title": "Clean the Carpet 🏠",
      "steps": [
        "Take broom",
        "Move furniture if needed.",
        "Clean properly.",
        "Empty dust bin.",
      ],
    },
    {
      "title": "Water the Plants 🌿",
      "steps": [
        "Use a watering can.",
        "Water roots, not leaves.",
        "Avoid waterflow from plant.",
      ],
    },
    {
      "title": "Dust the Furniture 🪑",
      "steps": [
        "Use a dry cloth.",
        "Wipe surfaces gently.",
        "Clean corners.",
        "Polish if needed.",
      ],
    },
    {
      "title": "Store Toys  🧸",
      "steps": [
        "Gather all toys.",
        "Sort by type.",
        "Place in bins.",
        "Put bins in their place.",
      ],
    },
    {
      "title": "Arrange the Table 🍽",
      "steps": [
        "Put mats.",
        "Arrange plates.",
        "Put utensils correctly.",
        "Add napkins.",
      ],
    },
    {
      "title": "Brush Your Teeth 🦷",
      "steps": [
        "Apply toothpaste.",
        "Brush for 2 minutes.",
        "Wash mouth.",
        "Clean toothbrush.",
      ],
    },
    {
      "title": "Take a Shower 🚿",
      "steps": [
        "Turn on water.",
        "Rub soap.",
        "Wash hair.",
        "Washcompletely.",
        "Dry.",
      ],
    },
    {
      "title": "Tie Your Shoes 👟",
      "steps": [
        "Make an 'X' with laces.",
        "Fold one side.",
        "Wrap other lace around.",
        " Tight laces.",
      ],
    },
    {
      "title": "Greet Someone Politely 👋",
      "steps": [
        "Make eye contact.",
        "Say 'Hello' or 'Good morning.'",
        "Smile.",
        "Listen to their response.",
      ],
    },
    {
      "title": "Sort Recyclables ♻",
      "steps": [
        "Separate paper, plastic, metal.",
        "Check labels.",
        "Place in correct bins.",
        "Take out when thery are full.",
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Essential Activites")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(tasks[index]["title"]),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskStepsScreen(task: tasks[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class TaskStepsScreen extends StatefulWidget {
  const TaskStepsScreen({super.key, required this.task});

  final Map<String, dynamic> task;

  @override
  _TaskStepsScreenState createState() => _TaskStepsScreenState();
}

class _TaskStepsScreenState extends State<TaskStepsScreen> {
  int currentStep = 0;

  void _nextStep() {
    if (currentStep < widget.task["steps"].length - 1) {
      setState(() {
        currentStep++;
      });
    }
  }

  void _prevStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.task["title"])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Step ${currentStep + 1} of ${widget.task["steps"].length}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              widget.task["steps"][currentStep],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: currentStep == 0 ? null : _prevStep,
                  child: const Text("Previous"),
                ),
                ElevatedButton(
                  onPressed:
                      currentStep == widget.task["steps"].length - 1
                          ? null
                          : _nextStep,
                  child: const Text("Next"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (currentStep == widget.task["steps"].length - 1)
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text("Finish"),
              ),
          ],
        ),
      ),
    );
  }
}
