import 'package:final_project/account/homeView.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const Color primaryColor = Color.fromARGB(255, 106, 228, 13); 
const Color tertiaryColor = Color(0xFFF5F5F5);
const String welcomeImage = 'assets/appbar_tree_home.png'; 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard Demo',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
      ),
      home: const DashboardView(title: 'My Dashboard'),
    );
  }
}

class DashboardView extends StatefulWidget {
  final String title;
  const DashboardView({super.key, required this.title});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  void _navigateTo(String pageTitle) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(title: pageTitle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tertiaryColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130), // Height of your header
        child: Container(
          decoration: const BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
            ),
          ),
          child: SafeArea( // Ensures content doesn't hit the status bar
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Hello! Welcome to GTR',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),

                          Text(
                            'Good Morning',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Colors.white54),
                          ),
                        ],
                      ),
                    ),
                   Spacer(),
                   Image(image: AssetImage(welcomeImage), width: 100, height: 100),
                   
                    // CircleAvatar(
                    //   radius: 25,
                    //   backgroundColor: Colors.white24,
                    //   backgroundImage: AssetImage(welcomeImage),
                    // ),
                    const SizedBox(width: 20)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      body: Stack( 
        children: [
          Container(color: primaryColor), 
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
              ),
            ),
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    cardHolder('Home', Icons.home_outlined, Colors.orange, 
                     () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeView(title: '')))),
                    cardHolder ('Result', Icons.graphic_eq_outlined, Colors.green, 
                      () => _navigateTo('Result Page')),
                    cardHolder('Community', Icons.group_outlined, Colors.purple, 
                      () => _navigateTo('Community Page')),
                    cardHolder('Forum', Icons.chat_bubble_outline, Colors.brown, 
                      () => _navigateTo('Forum Page')),
                    cardHolder('Account', Icons.money_outlined, Colors.indigo, 
                      () => _navigateTo('Account Page')),
                    cardHolder('Upload', Icons.add_circle_outline, Colors.teal, 
                      () => _navigateTo('Upload Page')),
                    
                    cardHolder('Settings', Icons.settings, Colors.grey, () {}),
                    cardHolder('Profile', Icons.person, Colors.blueGrey, () {}),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget cardHolder(String title, IconData iconData, Color background, VoidCallback onTap) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 5),
                color: Colors.black.withOpacity(.05),
                spreadRadius: 2,
                blurRadius: 5,
              )
            ],
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: background,
                  shape: BoxShape.circle,
                ),
                child: Icon(iconData, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                title.toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              )
            ],
          ),
        ),
      );
}

class DetailsPage extends StatelessWidget {
  final String title;
  const DetailsPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text('Welcome to the $title', style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}