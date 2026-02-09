import 'package:final_project/Screen/academic_year.dart';
import 'package:final_project/Screen/events.dart';
import 'package:final_project/Screen/holiday.dart';
import 'package:final_project/Screen/partners.dart';
import 'package:final_project/another/aboutGTR.dart';
import 'package:final_project/another/news.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MaterialApp(home: MorePage(title: '',)));

class MorePage extends StatefulWidget {
  const MorePage({super.key, required String title});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
 
  bool isEnglish = true;
  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder( 
        builder: (context, setDialogState) {
          
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Stack(
              children: [
                Text("Change Languages", style: TextStyle(fontSize: 20)),
                Positioned(
                  right: 0,
                  top: 0,
                  child: GestureDetector(

                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.close, color: Colors.grey),
                  ),
                )
              ],
            ),

            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _langOption("Khmer", "🇰🇭", !isEnglish, () {
                  setState(() => isEnglish = false); 
                  setDialogState(() {}); 
                }),
                _langOption("English", "🇬🇧", isEnglish, () {
                  setState(() => isEnglish = true); 
                  setDialogState(() {}); 
                }),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _langOption(String name, String flag, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(flag, style: TextStyle(fontSize: 40)),
          SizedBox(height: 8),
          Text(name, style:  TextStyle(fontWeight: FontWeight.bold)),
          
          Icon(
            Icons.check_circle, 
            color: isSelected ? Colors.blue : Colors.transparent
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              GridView.count(

                shrinkWrap: true,
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,

                children: [
                  _buildSmallCard(
                    context, Icons.account_balance, 
                    isEnglish ? "Academic Year" : "ឆ្នាំសិក្សា", 
                    AcademicYear(title: "Academic Year")),

                  _buildSmallCard(
                    context, Icons.rss_feed, 
                    isEnglish ? "News" : "ព័ត៌មាន", 
                    NewsPage(title: "News")),

                  _buildSmallCard(
                    context, 
                    Icons.business_center, 
                    isEnglish ? "Events" : "ព្រឹត្តិការណ៍", 
                    EventsPage(title: "Events")),

                  _buildSmallCard(
                    context, 
                    Icons.handshake, isEnglish ? "Partners" : "ដៃគូ", 
                    PartnersPage(title: "Partners")),
                ],
              ),

              Padding(
                padding:  EdgeInsets.symmetric(vertical: 20),
                child: Text(

                  isEnglish ? "Other" : "ផ្សេងៗទៀត", 
                  style: TextStyle(color: Color.fromARGB(255, 52, 5, 154), fontSize: 20, fontWeight: FontWeight.bold)
                ),
              ),

              Expanded(
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Expanded(

                          child: _buildLargeCard(context, 
                          Icons.public, isEnglish ? "Change Languages" : "ជ្រើសរើសភាសា", 
                          onTap: () => _showLanguageDialog(context))
                          ),

                        SizedBox(width: 10),

                        Expanded(

                          child: _buildLargeCard(
                            context, 
                            Icons.calendar_today, 
                            isEnglish ? "Holiday" : "ថ្ងៃឈប់សម្រាក", 
                            destination: HolidayPage(title: "Holiday"))
                            ),
                      ],
                    ),
                    SizedBox(height: 10),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Expanded(
                          child: _buildInfoCard(
                            context, isEnglish ? "About GTR" : "អំពី GTR", 
                            AboutGTRPage(title: "About GTR")),
                        ),
                        
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            children: [

                              _buildSocialCard(context, Icons.facebook, "Facebook", "https://www.facebook.com/share/181iLcf5Nm/?mibextid=wwXIfr"),
                              SizedBox(height: 10),
                              _buildSocialCard(context, Icons.play_arrow, "Youtube", ""),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  Text(
                  isEnglish 
                    ? "©2026 Department of Telecommunication and Network Engineering. All rights reserved."
                    : "©២០២៦ ដេប៉ាតឺម៉ង់ ទេព្យកោសល្យទូរគមនាគមន៍ និងបណ្ដាញ ។ រក្សាសិទ្ធិគ្រប់យ៉ាង",
                  textAlign: TextAlign.center, 
                  style: TextStyle(color: Colors.grey, fontSize: 11)
                ),

                ],
              ),

              Row(
                children: [
                  Text(
                  isEnglish 
                    ? "Version 4.1.8"
                    : "ជំនាន់ ៤.១.៨",
                  textAlign: TextAlign.center, 
                  style: TextStyle(color: Colors.grey, fontSize: 11)
                ),
                
                ],
              ),

                
              
            ],
          ),
        ),
      ),
    );
  }

  // Helper Card Builders
  Widget _buildSmallCard(BuildContext context, IconData icon, String label, Widget destination) {
    return GestureDetector(

      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => destination)),
      child: Container(

        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 188, 188, 245).withOpacity(0.2), 
          borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(icon, color: const Color.fromARGB(255, 64, 11, 188)),
            SizedBox(height: 5),
            Text(label, style: const TextStyle(color: Colors.blue, fontSize: 11), overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }

  Widget _buildLargeCard(BuildContext context, IconData icon, String label, {Widget? destination, VoidCallback? onTap}) {
    return GestureDetector(

      onTap: onTap ?? () => Navigator.push(context, MaterialPageRoute(builder: (context) => destination!)),
      child: Container(

        height: 100,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.blue.withOpacity(0.1), borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Icon(icon, color: Colors.blue, size: 30),
            Spacer(),
            Text(label, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, String text, Widget destination) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => destination)),
      child: Container(
        height: 140,
        padding: const EdgeInsets.all(12),
        //////////////////////
        decoration: BoxDecoration(color: Colors.blue.withOpacity(0.1), borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.info, color: Colors.blue, size: 30),
            SizedBox(height: 10),
            Text(text, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 15)),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialCard(BuildContext context, IconData icon, String label, String url) {
    return GestureDetector(
      onTap: () => _launchUrl(url),
      child: Container(
        height: 65,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        ////////////////////////
        decoration: BoxDecoration(color: Colors.blue.withOpacity(0.1), borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue, size: 30),
            SizedBox(width: 10),
            Text(label, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class SimpleScreen extends StatelessWidget {
  final String title;
  SimpleScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text(title)), body: Center(child: Text(title)));
}