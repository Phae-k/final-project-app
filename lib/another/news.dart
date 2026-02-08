import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  final String title;

  const NewsPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0,
      
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),

      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [

          _buildNewsItem(
            "សកម្មភាពប្រឡងបញ្ចប់ឆមាសទី​១",
            "05/02/2026",
            "assets/imagefinal.png",
            "",
          ),
            _buildDivider(),
            _buildNewsItem(
            "ការបណ្តុះបណ្តាលវិធីសាស្ត្រ និងយុទ្ធវិធីសម្រាប់លោកគ្រូ អ្នកគ្រូ",
            "Last Wednesday at 11:11 AM",
            "assets/bhdcbh.png",
            "",
          ),
          _buildDivider(),

           _buildNewsItem(
            "វីដេអូ ខ្លីពីក្លឹបMedia",
            "Last Week at 03:34PM",
            "assets/class.png",
            "",
          ),

          _buildDivider(),
          _buildNewsItem(
            "សកម្មភាព សិក្សា",
            "Last Month at 03:34PM",
            "assets/study.png",
            "",
          ),
          _buildDivider(),  
           _buildNewsItem(
            "ដេប៉ាតឺម៉ង់ទេពកោសល្យ​ ទូរគមនាគមន៍​ និងបណ្តាញ​ បានរៀបចំដំណេីរទស្សនកិច្ចសិក្សារបស់និស្សិតឆ្នាំទី៥​",
            "September 20 2025 at 11:11 AM",
            "assets/gtrVisited.png",
            "",
          ),
          _buildDivider(),
           _buildNewsItem(
            "ព្រឹត្តិការណ៍ Huawei Connect 2025 នៅទីក្រុងសៀងហៃ ប្រទេសចិន។​",
            "Juky 27 2025 at 11:11 PM",
            "assets/china.png",
            "",
          ),
          _buildDivider(),
        
          _buildNewsItem(
            "និស្សិត​ សាស្ត្រាចារ្យ​ និងបុគ្គលិក​ ដេប៉ាតឺម៉ង់ទេពកោសល្យ​ ទូរគមនាគមន៍​ និងបណ្តាញ​ នៃវិទ្យាស្ថានបច្ចេកវិទ្យាកម្ពុជា​ បានចូលរួមព្យុះហយាត្រាគាំទ្ររាជរដ្ឋាភិបាលកម្ពុជា​ និងលេីកទឹកចិត្តកងទ័ពជួរមុខ",
            "Jun 18 2025 at 11:06 AM",
            "assets/hol.png",
            "",
          ),
          
          _buildDivider(),
         
        ],
      ),
    );
  }

  Widget _buildNewsItem(String title, String date, String imagePath, String s) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 20),
                //////////////////////////////////
                Text(
                  date,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 100,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.image, color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.grey[200],
      height: 1,
      thickness: 1,
    );
  }
}