import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course Page',
      theme: ThemeData(useMaterial3: true),
      home: const FlutterCoursePage(),
    );
  }
}

class FlutterCoursePage extends StatelessWidget {
  const FlutterCoursePage({super.key});

  
  Future<void> _downloadFile(String url) async {
    final Uri uri = Uri.parse(url);
    
  
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
    
      debugPrint('Could not launch $url');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Course Materials"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Course Materials & Schedules",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            
            _buildDownloadCard(
              title: "Academic Schedule",
              icon: Icons.picture_as_pdf,
              color: Colors.redAccent,
              onTap: () => _downloadFile('https://drive.google.com/file/d/1INF4ApRvLD3godG7xCCqbLwNhcbO3GAe/view?usp=drive_link'),
            ),
            
            SizedBox(height: 15),

            _buildDownloadCard(
              title: "Textbook ",
              icon: Icons.table_chart,
              color: Colors.green,
              onTap: () => _downloadFile('https://drive.google.com/file/d/1OagEb521bwUg_xSIj4wTNv5nyotBn0m3/view?usp=drive_link'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDownloadCard({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            )
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 30),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
            const Icon(Icons.download, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}