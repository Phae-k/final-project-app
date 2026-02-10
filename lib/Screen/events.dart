import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  final String title;
  const EventsPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F8FD),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: Colors.black, size: 18),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          title, // FIXED: Removed 'widget.'
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: false,
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EventDetailPage(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(16)),
                      child: Image.asset(
                        'assets/event1.png',
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -20),
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.blue.shade100),
                          ),
                          child: const Text(
                            "06/06/2025 - 06/6/2025",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "ព្រឹត្តិការណ៍ ការតាំងពិព័រណ៍ ស្នាដៃនិស្សិត ផ្នែកបច្ចេកវិទ្យា ប្រចាំឆ្នាំ២០២៥",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(height: 12),
                          _buildInfoRow(Icons.near_me_outlined,
                              "ដេប៉ាតឺម៉ង់ ទេព្យកោសល្យទូរគមនាគមន៍ និងបណ្ដាញ"),
                          const SizedBox(height: 8),
                          _buildInfoRow(Icons.access_time, "08:00 am - 17:00 pm"),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey),
        const SizedBox(width: 8),
        Expanded(
            child: Text(text,
                style: const TextStyle(color: Colors.grey, fontSize: 13))),
      ],
    );
  }
}

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/event1.png',
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.5),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow(
                      Icons.calendar_today_outlined, "06/06/2025 - 06/6/2025"),
                  _buildDetailRow(Icons.access_time, "08:00 am - 17:00 pm"),
                  _buildDetailRow(Icons.near_me_outlined,
                      "ដេប៉ាតឺម៉ង់ ទេព្យកោសល្យទូរគមនាគមន៍ និងបណ្ដាញ"),
                  const SizedBox(height: 16),
                  const Text(
                    "ការតាំងពិព័រណ៍ស្នាដៃ និស្សិត ផ្នែកបច្ចេកវិទ្យា ប្រចាំឆ្នាំ២០២៥",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 24),
                  const Text("ព័ត៌មានលម្អិត",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset('assets/event2.png'),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "ព្រឹត្តិការណ៍ការតាំងពិព័រណ៍ស្នាដៃនិស្សិត គឺជាវេទិកាដ៏សំខាន់ប្រចាំឆ្នាំ ដែលអនុញ្ញាតឱ្យសិស្សានុសិស្សបង្ហាញពីសមត្ថភាព និងការច្នៃប្រឌិតរបស់ខ្លួន។ ",
                    style: TextStyle(height: 1.5, color: Colors.black87),
                  ),
                  const Text(
                    "- ការបង្ហាញស្នាដៃបច្ចេកវិទ្យា៖ មានការដាក់បង្ហាញគម្រោងបច្ចេកវិទ្យាទំនើបៗ រួមមាន ប្រព័ន្ធគ្រប់គ្រងវត្តមានឆ្លាតវៃ (Smart Attendance System) តាមរយៈការសម្គាល់ផ្ទៃមុខ (AI Facial Recognition) និងគំរូផ្ទះឆ្លាតវៃ (Smart Home Solution)។ ",
                    style: TextStyle(height: 1.5, color: Colors.black87),
                  ),
                  const Text(
                    "- ការស្រាវជ្រាវ និងការអភិវឌ្ឍ៖ ព័ត៌មានបានបង្ហាញពីសកម្មភាពរបស់មន្ទីរពិសោធន៍ ដែលផ្តោតលើការទំនាក់ទំនងអេឡិចត្រូនិច និងវិស្វកម្មបណ្តាញ (Telecommunication and Network Engineering)។ ",
                    style: TextStyle(height: 1.5, color: Colors.black87),
                  ),
                  const Text(
                    "- សមិទ្ធផលជាក់ស្តែង៖ និស្សិតបានបង្ហាញពីការអនុវត្តផ្ទាល់លើគ្រឿង Hardware, បន្ទះសៀគ្វី និងការប្រើប្រាស់បច្ចេកវិទ្យា 5G ដើម្បីដោះស្រាយបញ្ហាក្នុងសង្គម។ \n- គោលបំណង៖ ដើម្បីចែករំលែកចំណេះដឹង បទពិសោធន៍ និងបង្ហាញពីលទ្ធផលនៃការសិក្សាស្រាវជ្រាវយ៉ាងយកចិត្តទុកដាក់ជូនដល់អាណាព្យាបាល ភ្ញៀវកិត្តិយស និងសាធារណជនបានទស្សនា និងស្វែងយល់។",
                    style: TextStyle(height: 1.5, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.blue),
          const SizedBox(width: 12),
          Text(text,
              style: const TextStyle(
                  color: Colors.blue, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}