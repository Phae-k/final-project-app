import 'package:final_project/Screen/notification.dart';
import 'package:flutter/material.dart';
import 'semesterI.dart'; 
import 'flutter_course.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeView(title: '',),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key, required String title});

  final List<Map<String, String>> semesterData = const [
    {'name': 'Semester 1', 'year': 'Year 1'},
    {'name': 'Semester 2', 'year': 'Year 1'},
    {'name': 'Semester 1', 'year': 'Year 2'},
    {'name': 'Semester 2', 'year': 'Year 2'},
    {'name': 'Semester 1', 'year': 'Year 3'},
    {'name': 'Semester 2', 'year': 'Year 3'},
    {'name': 'Semester 1', 'year': 'Year 4'},
    {'name': 'Semester 2', 'year': 'Year 4'},
    {'name': 'Semester 1', 'year': 'Year 5'},
    {'name': 'Semester 2', 'year': 'Year 5'},

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              _buildHeader(context),
              const SizedBox(height: 25),
              
              _buildSemesterList(context), 
              
              SizedBox(height: 30),
              Text('Semester Courses', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 15),
              
              _buildCourseCarousel(context), 
              
              SizedBox(height: 30),
              _buildReadingHeader(),
              _buildReadingItem(),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildSemesterList(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: semesterData.length,
        separatorBuilder: (context, index) => const SizedBox(width: 15),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              
              if (index == 0) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SemesterOnePage()));
              } else {
               
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Clicked ${semesterData[index]['name']} - ${semesterData[index]['year']}")),
                );
              }
            },
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: index == 0 ? Colors.indigo : Colors.indigo.withOpacity(0.5),
                  child: Text('${index + 1}', style: const TextStyle(color: Colors.white)),
                ),
                 SizedBox(height: 5),
                Text(semesterData[index]['name']!, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                Text(semesterData[index]['year']!, style: const TextStyle(fontSize: 10, color: Colors.grey)),
              ],
            ),
          );
        },
      ),
    );
  }
  
  Widget _buildCourseCarousel(BuildContext context) {
    final List<Map<String, String>> courses = [
      {'title': 'Flutter Cousre', 'img': 'assets/imageflutter.png'},
      {'title': 'Digital Circuit Design', 'img': 'assets/imagevhdl.png'},
      {'title': 'Digital Signal Processing', 'img': 'assets/dsp.png'},
      {'title': 'TCP/IP and Internet', 'img': 'assets/tcp.png'},
    ];

    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (index == 0) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FlutterCoursePage()));
              }
            },
            child: Container(
              width: 200,
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[100],
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                    child: Image.network(courses[index]['img']!, height: 120, width: double.infinity, fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(courses[index]['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  
Widget _buildHeader(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          Text('Welcome back!', style: TextStyle(color: Colors.grey)),
          Text('Student App', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold
          )),
        ]
      ),
      
      IconButton(
        icon: const Icon(Icons.notifications_outlined, size: 30),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NotificationPage(title: 'Notification')),
          );
        },
      ),
    ],
  );
}

  Widget _buildReadingHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Further Readings', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextButton(onPressed: () {}, child: const Text('See all')),
      ],
    );
  }

  Widget _buildReadingItem() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(15)),
      child: const Row(
        children: [

          Icon(Icons.book, size: 40, color: Colors.indigo),
          SizedBox(width: 15),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Engineering', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Basic Library', style: TextStyle(color: Colors.grey, fontSize: 12)),
          ]),
        ],
      ),
    );
  }
}