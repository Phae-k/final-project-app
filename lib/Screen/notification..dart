import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  final String title;
  const NotificationPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    
    final List<Map<String, String>> notifications = [

      {
        "kh": "ការចូលរៀនសម្រាប់​​​ឆមាសទី​២ ឆ្នាំទី​២​​ ដល់​ឆ្នាំទី៥(១៦/កម្ភុះ/២០២៦)",
        "en": "Enrollment for Semester 2, Year 2 to Year 5 (February 16, 2026)",
        "date": "Feb 06"
      },
    
      {
        "kh": "ប្រឡងបញ្ចប់ឆមាសទី​១​​​ ឆ្នាំទី​២​​ ដល់​ឆ្នាំទី៥(០៣-០៤/កម្ភុះ/២០២៦)",
        "en": "Final exam Semester I for year 2 to year 5 (03-04/Feb/2026)",
        "date": "Jan 24"
      },
      // {ប្រព្រឹត្តិទៅចាប់ពីថ្ងៃទី​១៨ ដល់ថ្ងៃទី​២០ កញ្ញា
      //   "kh": "ប្រឡងពាក់កណ្ដាលឆមាសទី​១ ឆ្នាំទី​២​​​ ដល់​ឆ្នាំទី៥​ (០៣-៣០/ធ្នូ/២០២៥)",
      //   "en": "Midterm exam Semester I for year 2 to year 5  (03-30, May 2024)",
      //   "date": "Dece 03"
      // },
      
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        
        surfaceTintColor: Colors.white, 
        scrolledUnderElevation: 0,     
       
        
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 28),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: false,
        titleSpacing: 0,
        
      ),
      
      body: ListView.separated(
        itemCount: notifications.length,
        separatorBuilder: (context, index) => const Divider(height: 1, color: Color(0xFFEEEEEE)),
        itemBuilder: (context, index) {
          final item = notifications[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: Color(0xFF007AFF),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.list_alt, color: Colors.white, size: 28),
            ),
            title: Text(
              item['kh']!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black87,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  item['en']!,
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  item['date']!,
                  style: const TextStyle(color: Color(0xFF007AFF), fontSize: 13),
                ),
              ],
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}