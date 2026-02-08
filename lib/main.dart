import 'package:final_project/Screen/notification..dart';
import 'package:final_project/another/more_page.dart';
import 'package:final_project/page_account.dart';
import 'package:final_project/page_home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:final_project/firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((_) {
    print("Firebase connected.");
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign In Page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 104, 52, 237)),
        useMaterial3: true,
      ),
     
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomePage(title: ''),
    AccountPage(title: ''),
    MorePage(title: ''),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

   @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          
          if (_selectedIndex != 1)
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [

                Image.asset(
                  'assets/gtr_logo.png',
                  height: 50,
                ),

                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Text(
                      'DEPARTMENT OF TELECOMMUNICATIONS \nAND NETWORK ENGINEERING ',
                      style: TextStyle(
                        fontSize: 10, //15
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    Text(
                      'DEPARTEMENT DE GENIE TÉLÉCOMS ET RÉSEAUX',
                       style: TextStyle(
                        fontSize: 10, //13
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              
                if (_selectedIndex == 0) ...[
                  Spacer(), 
                  
                  IconButton(
                    icon: Icon(Icons.notifications_active, color: Colors.deepPurple),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const NotificationPage(title: "Notification")),
                      );
                    },
                  ),
                ],
              ],
            ),
          ),

        Expanded(
          child: _pages[_selectedIndex],
        ),
      ],
    ),
    
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: [

        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'More'),
      ],
    ),
  );
}
}