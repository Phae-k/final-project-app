import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HolidayPage(title: 'Scanner Page'),
    );
  }
}

class HolidayPage extends StatefulWidget {
  const HolidayPage({super.key, required this.title});

  final String title;

  @override
  State<HolidayPage> createState() => _HolidayPageState();
}

class _HolidayPageState extends State<HolidayPage> {
  
  
  @override
  void initState() {
    super.initState();
    init();
  }
  
  void init() {}

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            Text('Holiday',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              ),),
              
            SizedBox(height: 10),
            Text("There's no holiday available for now, "),
            SizedBox(height: 10),
            Text("please wait for the announcement from the school."),

          ],
        ),
      ), 
    );
  } 
}