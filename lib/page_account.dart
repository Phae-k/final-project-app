// scanner.dart
import 'package:final_project/page_sigin.dart';
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
      title: '',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const AccountPage(title: ''),
    );
  }
}

class AccountPage extends StatefulWidget {
  const AccountPage({super.key, required this.title});

  

  final String title;

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final gtr_logo = Image.asset('assets/gtr_logo.png');
  


  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0, 
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              SizedBox(
                   height: 150, 
                   child: gtr_logo),
                   SizedBox(
                   height: 20
                ),
             
               SizedBox(height: 1),
              Text(
                "ដេប៉ាតឺម៉ង់ ទេព្យកោសល្យទូរគមនាគមន៍ និងបណ្ដាញ ",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8B0000), // Dark Red
                ),
              ),


              Text(
                "DEPARTMENT OF TELECOMMUNICATIONS AND NETWORK ENGINEERING",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8B0000),
                ),
              ),
              SizedBox(height: 20),

              Text(
                "DEPARTEMENT DE GENIE TÉLÉCOMS ET RÉSEAUX",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.5,
                ),
                textAlign: TextAlign.center,
              ),


              Text(
                "GTR",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 30),

              Text(
                "The first social education network in the Kingdom of Cambodia. "
                "Learn, research, share, test, read books and do other things",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 40),

              OutlinedButton(
                onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.blue.shade700,
                      foregroundColor: Colors.white,
                    ),
                    child: Text("Teacher Account")),

                    SizedBox(height: 15),

              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SigninPage(title: "Student Account")),
                    );
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.blue.shade700,
                      foregroundColor: Colors.white,
                    ),
                    child: Text("Student Account",)),

                    

              

                    


             
              // _buildAccountButton(
              //   text: "Parent Account",
              //   color: Colors.blue.shade700,
              //   textColor: Colors.white,
              // ),
              // const SizedBox(height: 15),
              // _buildAccountButton(
              //   text: "Teacher Account",
              //   color: Colors.grey.shade50,
              //   textColor: Colors.black87,
              //   showBorder: true,
              // ),
              // const SizedBox(height: 15),
              // _buildAccountButton(
              //   text: "Student Account",
              //   color: Colors.grey.shade50,
              //   textColor: Colors.black87,
              //   showBorder: true,
              // ),
              
              SizedBox(height: 40),

              // --- Footer ---
              const Text(
                "© 2026 Auxswot",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}