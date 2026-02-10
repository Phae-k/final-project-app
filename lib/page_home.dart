import 'package:final_project/Screen/deputyHeadDepartment.dart';
import 'package:final_project/Screen/headDepartment.dart';
import 'package:flutter/material.dart';
import 'package:final_project/Screen/academic_year.dart';
import 'package:final_project/Screen/events.dart';
import 'package:final_project/Screen/feedback.dart';
import 'package:final_project/Screen/holiday.dart';
import 'package:final_project/Screen/partners.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'School Info App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'School Info'),
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
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            SizedBox(
              height: 200, 
              width: double.infinity, 
              child: abcd),

            SizedBox(height: 10),

            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildMenuButton(context, label: "Academic Year", iconPath: Icons.school, color: Colors.blue, destination: AcademicYear(title: "Academic Year")),
                  _buildMenuButton(context, label: "Events", iconPath: Icons.stars, color: Colors.orange, destination: const EventsPage(title: "Events")),
                  _buildMenuButton(context, label: "Partners", iconPath: Icons.handshake, color: Colors.purpleAccent, destination: const PartnersPage(title: "Partners")),
                  _buildMenuButton(context, label: "Holiday", iconPath: Icons.luggage, color: Colors.teal, destination: const HolidayPage(title: "Holiday")),
                  _buildMenuButton(context, label: "Feedback", iconPath: Icons.lightbulb, color: Colors.amber, destination: const FeedBackPage(title: "Feedback")),
                ],
              ),
            ),

            SizedBox(height: 25),
            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Management Team", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
            
            SizedBox(height: 10),
            _buildManagementItem(
              context,
              name: "SRENG SOKCHENDA",  
              role: "Head of Department",
              image: 'assets/imageteacher.png',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HeadDepartmentPage(title: 'Management Team'))),
            ),
            _buildManagementItem(
              context, 
              name: "THOURN KOSORL", 
              role: " Deputy Head of Department", 
              image: 'assets/imageteacher.png',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const DeputyHeadDepartmentPage(title: 'Management Team',))),
              ),

            SizedBox(height: 50),

            Row(
              children: [
                Text(
                  "      ©2026 Departement de Genie Télécoms et Réseaux, Tous droits réservés.",
                   textAlign: TextAlign.center,
                   style: TextStyle(color: Colors.grey, fontSize: 10),
            ),
              ],
            ),

            Row(
              children: [
                Text(
              "      Version 4.1.8",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 10),
            ),
              ],
            ),
             Row(
              children: [
                Text(
              "      Propulsé par", 
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey,  fontSize: 10),

            ),
            Text(
              " Group 11",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 10),

            ),
            
              ],
            ),
            
            
          ],
        ),
      ),
    );
  }

  
  Widget _buildManagementItem(BuildContext context, {required String name, required String role, required String image, VoidCallback? onTap}) {
    return ListTile(
      leading: CircleAvatar(radius: 28, backgroundImage: AssetImage(image)),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
      subtitle: Text(role, style: const TextStyle(color: Colors.grey, fontSize: 13)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
      onTap: onTap,
    );
  }

  Widget _buildMenuButton(BuildContext context, {required String label, required IconData iconPath, required Color color, required Widget destination}) {
    return Expanded(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [color.withOpacity(0.7), color]),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4, offset: const Offset(0, 2))],
            ),
            child: IconButton(
              iconSize: 35,
              icon: Icon(iconPath, color: Colors.white),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => destination)),
            ),
          ),
          SizedBox(height: 8),
          Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.black87)),
        ],
      ),
    );
  }
}