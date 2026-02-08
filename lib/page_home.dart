import 'package:final_project/Screen/academic_year.dart';
import 'package:final_project/Screen/events.dart';
import 'package:final_project/Screen/feedback.dart';
import 'package:final_project/Screen/holiday.dart';
import 'package:final_project/Screen/partners.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(title: 'School Info'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final abcd = Image.asset('assets/abcd.png');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(
              height: 200,
              width: 500,
              child: abcd
              ),
                   
            SizedBox(height: 1),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildMenuButton(
                    context,
                    label: "Academic Year",
                    iconPath: Icons.school, // Use Icons or Image.asset
                    color: Colors.blue,
                    destination: AcademicYear(title: "Academic Year"),
                  ),

                  _buildMenuButton(
                    context,
                    label: "Events",
                    iconPath: Icons.stars,
                    color: Colors.orange,
                    destination: const EventsPage(title: "Events"),
                  ),

                  _buildMenuButton(
                    context,
                    label: "Partners",
                    iconPath: Icons.handshake,
                    color: Colors.purpleAccent,
                    destination: const PartnersPage(title: "Partners"),
                  ),

                  _buildMenuButton(
                    context,
                    label: "Holiday",
                    iconPath: Icons.luggage,
                    color: Colors.teal,
                    destination: const HolidayPage(title: "Holiday"),
                  ),

                  _buildMenuButton(
                    context,
                    label: "Feedback",
                    iconPath: Icons.lightbulb,
                    color: Colors.amber,
                    destination: const FeedBackPage(title: "Feedback"),
                  ),
                ],
              ),
            ),
            




            SizedBox(height: 150),
            Text(
                  "©2026 Department of Telecommunication and Network Engineering. All rights reserved.\nVersion 4.1.8"
                  "\nby ENG SOPHEAK and HUN MEILY",
                  textAlign: TextAlign.center, 
                  style: TextStyle(color: Colors.blue, fontSize: 12)
                ),

            
          ],
        ),
      ),
    );
  }
  
  Widget _buildMenuButton(
    BuildContext context, {
    required String label,
    required IconData iconPath,
    required Color color,
    required Widget destination,
  }) {
    return Expanded(
      child: Column(
        children: [

          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [color.withOpacity(0.7), color],
              ),

              boxShadow: [

                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),

            child: IconButton(
              iconSize: 35,
              icon: Icon(iconPath, color: Colors.white),
              onPressed: () {
               
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => destination),
                );
              },
            ),
          ),
          
          SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  final String title;
  const PlaceholderPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text("Welcome to $title")),
    );
  }
}