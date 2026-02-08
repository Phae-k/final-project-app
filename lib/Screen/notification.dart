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
        "date": "February 06"
      },
    
      {
        "kh": "ប្រឡងបញ្ចប់ឆមាសទី​១​​​ ឆ្នាំទី​២​​ ដល់​ឆ្នាំទី៥(០៣-០៤/កម្ភុះ/២០២៦)",
        "en": "Final exam Semester I for year 2 to year 5 (03-04/Feb/2026)",
        "date": "January 24"
      },

     {
        "kh": "ការចូលរៀននឹងប្រព្រឹត្តទៅចាប់ពីថ្ងៃទី០៧ ខែតុលា ឆ្នាំ២០២៥ តាមកាលវិភាគកំណត់",
        "en": "The enrollment will take place starting from October 07, 2025",
        "date": "October 01 2025"
      },

       {
        "kh": "ប្រឡងឆមាសទី2 នៅថ្ងៃទី 01-02 ខែ កក្កដា ឆ្នាំ២០២៥ ឆ្នាំទី​២​​ ដល់​ឆ្នាំទី៤",
        "en": "Semester 2 examination on July 01–02, 2025",
        "date": "June 12 2025"
      },

      {
        "kh": "ប្រឡងឆមាសទី១ នៅថ្ងៃទី​០៤ ០៥ ខែ កម្ភុះ​ ឆ្នាំ២០២៥ ឆ្នាំទី​២​​ ដល់​ឆ្នាំទី៥",
        "en": "Semester 1 examination on Febuary 04-05, 2025",
        "date": "January 30 2025"
      },

      {
        "kh": "ការចូលរៀននឹងប្រព្រឹត្តទៅចាប់ពីថ្ងៃទី០៧ ខែតុលា ឆ្នាំ២០២៤ តាមកាលវិភាគកំណត់",
        "en": "The enrollment will take place starting from October 07, 2024",
        "date": "October 04 2024"
      },


      {
        "kh": "ប្រឡងឆមាសទី២ នៅថ្ងៃទី ០៦-០៧ ខែ សីហា ឆ្នាំ២០២៤",
        "en": "Semester 2 examination on August 06-07, 2023, year2",
        "date": "July 30 2024"
      },

      {
        "kh": "ប្រឡងឆមាសទី១ថ្ងៃទី១៩,២០ មីនា ២០២៤",
        "en": "Semester 1 examination on Feb 18–20, 2024, year2",
        "date": "February 20 2024"
      },

      {
        "kh": "ការចូលរៀននឹងប្រព្រឹត្តទៅចាប់ពីថ្ងៃទី៥ ធ្នូ ២០២៣  ឆ្នាំទី​២",
        "en": "The enrollment will take place starting from December 04, 2023",
        "date": "December 04 2023"
      },

      {
        "kh": "ប្រឡងឆមាសទី2 នៅថ្ងៃទី06-07 ខែ វិឆ្ឆិកា ឆ្នាំ២០២៣",
        "en": "Semester 2 examination on November 26–27, 2023, year1",
        "date": "June 12 2023"
      },

      {
        "kh": "ប្រឡងឆមាសទី១ នៅថ្ងៃទី26-27 ខែ កក្កដា ឆ្នាំ២០២៣",
        "en": "Semester 1 examination on July 26–27, 2023, year1",
        "date": "June 12 2023"
      },

      {
        "kh": "ការចូលរៀននឹងប្រព្រឹត្តទៅចាប់ពីថ្ងៃទី២០ ខែកុម្ភៈ ឆ្នាំ២០២៣ តាមកាលវិភាគកំណត់",
        "en": "The enrollment will take place starting from February 20, 2023",
        "date": "February 14 2023"
      },

      {
        "kh": "ការប្រជុំបើកបវេសនកាលនៅថ្ងៃព្រហស្បតិ៍ ទី១៦ ខែកុម្ភៈ ឆ្នាំ២០២៣​ ឆ្នាំទី​១",
        "en": "Opening ceremony meeting on Thursday, February 16, 2023, Year 1.",
        "date": "February 14 2023"
      },
      
    ];

    return Scaffold(
      //backgroundColor: Colors.white,
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