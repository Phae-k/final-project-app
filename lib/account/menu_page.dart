import 'package:final_project/account/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyNavigationMenu extends StatelessWidget {
  final String title;

  const MyNavigationMenu({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  title,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),

         SizedBox(height: 20),

          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
               
               
                ListTile(
                  leading: const Icon(Icons.home_outlined),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeAccPage(title: ''),
                      ),
                    );
                  },
                ),

              
              
                ExpansionTile(
                  leading: Icon(Icons.person_outline, color: Colors.black
                  ),
                  title: Text(
                    'Personal Information',
                    // style: TextStyle(fontWeight: FontWeight.bold, //color: Colors.black
                    // ),
                  ),
                  childrenPadding: const EdgeInsets.only(left: 20),

                  children: [
                    _buildInfoTile(context, Icons.badge_outlined, "ID:", DetailInfoPage(detail: "ID Page")),
                    _buildInfoTile(context, Icons.account_circle_outlined, "Last Name:", DetailInfoPage(detail: "Last Name Page")),
                    _buildInfoTile(context, Icons.account_circle_outlined, "First Name:", DetailInfoPage(detail: "First Name Page")),
                    _buildInfoTile(context, Icons.phone_android_outlined, "Phone Number:",  DetailInfoPage(detail: "Phone Number Page")),
                    _buildInfoTile(context, Icons.email_outlined, "Email:", DetailInfoPage(detail: "Email Page")),
                    _buildInfoTile(context, Icons.home_work_outlined, "Address:",DetailInfoPage(detail: "Address Page")),
                  ],
                ),

                
                ExpansionTile(
                  leading: Icon(Icons.lock_outline, color: Colors.black),
                  title: Text(
                    'Credential',
                    //style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  childrenPadding: const EdgeInsets.only(left: 20),
                  children: [
                    _buildInfoTile(context, Icons.person_outline, "Username:", const DetailInfoPage(detail: "Username Page")),
                    _buildInfoTile(context, Icons.lock_outline, "Password: **********", const DetailInfoPage(detail: "Password Page")),
                  ],
                ),
                //Divider(),
                
              ],
            ),
          ),
        ],
      ),
    );
  }

  
  Widget _buildInfoTile(BuildContext context, IconData icon, String label, Widget destinationPage) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(
        label,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      dense: true, 
      onTap: () {
      
        Navigator.pop(context); 
       
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationPage),
        );
      },
    );
  }
}


class DetailInfoPage extends StatelessWidget {
  final String detail;
  const DetailInfoPage({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(detail)),
      body: Center(child: Text("Welcome to the $detail")),
    );
  }
}