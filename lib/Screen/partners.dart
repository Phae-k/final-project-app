import 'package:flutter/material.dart';

class PartnersPage extends StatelessWidget {
  final String title;
  const PartnersPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 18),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          title, 
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: false,
        titleSpacing: 0,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildPartnerCard(
            context,
            'assets/moeys.png',
            'Ministry of Education, Youth and Sport',
            const PartnerDetailPage(
              imageUrl: 'assets/moeys.png',
              title: 'Ministry of Education, Youth and Sport',
            ),
          ),
          SizedBox(height: 12),
          _buildPartnerCard(
            context,
            'assets/huawei.png',
            'Huawei - International Telecom Company',
            const PartnerDetailPage(
              imageUrl: 'assets/huawei.png',
              title: 'Huawei - International Telecom Company',
            ),
          ),
          SizedBox(height: 12),
          _buildPartnerCard(
            context,
            'assets/utp.png',
            'Universit Teknologi Petronas',
            const PartnerDetailPage(
              imageUrl: 'assets/utp.png',
              title: 'Universit Teknologi Petronas',
            ),
          ),
          const SizedBox(height: 12),
          _buildPartnerCard(
            context,
            'assets/IMT.png',
            'Institut Miness-Télécom ',
            const PartnerDetailPage(
              imageUrl: 'assets/IMT.png',
              title: 'Institut Miness-Télécom',
            ),
          ),
          SizedBox(height: 12),
          _buildPartnerCard(
            context,
            'assets/toko.png',
            'Tokyo Institute of Technology',
            const PartnerDetailPage(
              imageUrl: 'assets/toko.png',
              title: 'Tokyo Institute of Technology',
            ),
          ),
          SizedBox(height: 12),
          _buildPartnerCard(
            context,
            'assets/igtech.png',
            'IG Tech Group',
            const PartnerDetailPage(
              imageUrl: 'assets/igtech.png',
              title: 'IG Tech Group',
            ),
          ),
          SizedBox(height: 12),
           _buildPartnerCard(
            context,
            'assets/cau.png',
            'Chung-Ang University',
            const PartnerDetailPage(
              imageUrl: 'assets/cau.png',
              title: 'Chung-Ang University',
            ),
          ),
           _buildPartnerCard(
            context,
            'assets/inp.png',
            'INP-ENSEEIHT',
            const PartnerDetailPage(
              imageUrl: 'assets/inp.png',
              title: 'INP-ENSEEIHT',
            ),
          ),
          SizedBox(height: 12),
          
        ],
      ),
    );
  }

  Widget _buildPartnerCard(BuildContext context, String imagePath, String text, Widget? destination) {
    return GestureDetector(
      onTap: () {
        if (destination != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => destination));
        }
      },
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              child: Image.asset(
                imagePath,
                width: 150,
                height: 130,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => 
                    Container(color: Colors.grey[300], width: 150, child: const Icon(Icons.broken_image)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PartnerDetailPage extends StatelessWidget {
  final String imageUrl;
  final String title;

  const PartnerDetailPage({super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageUrl,
              width: double.infinity,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => 
                  Container(height: 200, color: Colors.grey[200], child: const Icon(Icons.broken_image, size: 50)),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}