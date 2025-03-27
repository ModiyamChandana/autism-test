Autism Development Support
                        _ personalized time table and developmental activities based on CARS assessment
According to the study of Indian Academic of Pediatrics (IAP) 3% of the whole India population is facing autism . one person out of 100 people are suffering from this disorder.  
Autism Spectrum Disorder is a neurodevelopmental condition characterized by persistent challenges in social communication, interaction, and behavior. We found a solution for this issue by initializing the CARS based test, followed by the results. It provides the severity level of the autistic person (still finding a way to improve the accuracy using the ML machine learning models). Then provides the weekly time table according to the severity level of the person. It also contains SOS button which will be connecting the calls to the personalize contacts(which should be done).
1. SEVERITY TEST (CARS TEST) :
   Description :
          CARS is abbreviated as Childhood Autism Rating Scale. CARS is a test for predicting the level of severity of an individual .
Test Screen
   Two Parts:
             ->Question Part: Shows one question at a time.
             ->Result Part: Shows the autism severity level after all questions.
The libraries which are imported in specific features in material.dart. 
    1)It have similar UI components.They are
             ->MaterialApp(It is used to create the main app structure)
             ->Scaffold(It is used to create the basic screen layout)
             ->AppBar(It is used to create the top navigation bar)
             ->Text(The Text is used to display text on the screen)
             ->Button(The Button is used to handle user interactions, such as clicks or taps)
             ->Icon( The Icon is used to display a visual representation of an object or concept)
             ->Navigator(Navigator widget is used to manage a stack of routes, which represent different screens or pages within an app.)
    2)Built-in Flutter Widgets used:
             ->Layout(layouts are used to arrange widgets in a specific way on the screen. 
                                   *Container: A generic layout that can be used to create a container with a specific width, height, and padding.
                                   *Column: Arranges widgets vertically.
                                   *Padding: It is used to add space around its child widget.
                                   *SizedBox: It is used to create a box with a specified size.)
             ->Cards(It is used to create a card-like container for content.)
             ->Buttons(It is used to create interactive elements that respond to user input, such as clicks or taps.
                                   *ElevatedButton: A button with elevation and a shadow, used to represent a primary action.
                                   *TextButton: A button with only text and no elevation or outline, used to represent a text-based action.)
             ->Styling(It is used to customize the visual appearance of widgets and apps.
                                   *ThemeData: It's used to define the overall look.
                                   *BoxDecoration: It is used to style the background of a widget, such as a Container, Card, or Button.
                                   *LinearGradient: is used to create a linear gradient effect on a widget's background.)
             ->State Management(It refers to the process of managing the state of an app, which includes the data and properties that can change during the app's lifetime.
                                   *Statefulwidget: A widget that has its own state.
                                   *setState(): It is a method that is used to update the state of a StatefulWidget.)
Question Part
     ->What it does: Shows autism related questions one by one.
     ->what's on it:
           *A back button(<-) to go to the previous question.
           *Four answer buttons(1 to 4, from "Not a symptom" to "Severe").
Results Part
     ->What it does: Shows the test result after all questions.
     ->What's on it:
          *A home button to go back to the start.
          *A message: "Test Completed!".
          *The result (e.g., "Your Severity Level: Moderate Symptoms").
          *A green "Restart Test" button to take the test again.
          *A "Return to Home" link to go back to the first screen.
The calculation of the severity of the condition is based on the scores the person gained in the CARS test.
Scoring :
The options given are 
      1.Not a symptom 
      2.Mild 
      3.Moderate 
      4.Severe
Each option is marked with 1mark 2 marks 3 and 4 marks. After choosing the option machine converts the code into number and adds up. The value will be divided by the number of questions.
Results :
      ->If it is below 1.5 then it is mild symptom or no symptom.
      ->If it is between 1.5 and 2.5 then the person have moderate symptom.
      ->If it exceeds 2.5 then it is severe symptoms.
In this way the prediction is done to test the severity.



From the CARS test feature, the user will come to know about what is the severity level the user is facing. 
TIME TABLE  PLANNER FEATURE :
        ->According to the results the user get, the user will select the option given. 
        ->According to the option the user chooses the time table is set.
        ->In a weekly planner it gives a specific number of activities that should be done by the user to improve and develope themselves. It provides the daily planner for a week which helps the user to improve
        ->It is also a user friendly schedule it allows the user to schedule the daily activities as per their suitable times.
The libraries used are:
        *flutter/material.dart(Helps create buttons, lists, dropdowns, and time pickers for the app.)
        *TimeOfDay from showTimePicker(Lets the user pick a time for activities.)
        *StatefulWidget and setState(Used to update the screen when the user changes severity or sets a time.)
        *DropdownButton and ExpansionTile(Used to choose the severity level and expand/collapse daily schedules.)

SOS BUTTON    
       THE EMERGENCY FEATURE:
        ->Initially it displays a button that navigates to the Emergency Help page.
        ->It is the main page where user can find the symbol of the SOS button
        ->By clicking on the symbol it directly connects the call and a chatbot message is sent to the personalised contacts in case of emergency (This feature needs to be implemented using ML and AI)
          *flutter/material.dart is the main library used in the main code. It is a material design library.
          *Scaffold, AppBar, IconButton, ElevatedButton are the other libraries used for building up the interface.


ACTIVITIES TO DEVELOP AND IMPROVE THE AUTISTIC CONDITION:

This is a very interesting and a major feature of the app. It contains many intresting games and activities which are presented in the app to improve the skills.

     ->Breath in breath out :
              *Helps to calm down and improves concentration 
    ->Memory game :
              *Helps in improving the memory power and concentration.
    ->Scribbling :
              *Few autistic people will suffer from hand grip issues, this games helps to improve the grip of the user hand.
    ->1 to 9 :
              *Helps to match out the same number which improves concentration, patience levels and learning skills.
    ->A to Z :
              *Helps to match out the same alphabet which improves concentration, patience levels and learning skills.
    ->Waiting time :
              *This games improves the patience levels more and more.
    ->Step by step :
              *This ensures that the user will learn all the daily bases activities in a step by step manner.
    ->Fruit Ninja :
              *This game helps in improving the finger grip, concentration also patience levels.
    ->Expression :
              *This feature in the activities helps to learn the emotions by expressions, this game is represented by the emoji.
