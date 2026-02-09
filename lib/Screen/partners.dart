import 'package:flutter/material.dart';

class PartnersPage extends StatelessWidget {
  final String title;
  const PartnersPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(title, style: const TextStyle(fontSize: 18, color: Colors.black)),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),

        ),
      ),
      
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildPartnerCard(
            context,
            'assets/huawei.png',
            'Huawei - International Telecom Company',
            PartnerDetailPage(
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
          SizedBox(height: 12),

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
            'assets/tokyo.png',
            'Tokyo Institute of Technology – Japan',
            const PartnerDetailPage(
              imageUrl: 'assets/tokyo.png',
              title: 'Tokyo Institute of Technology – Japan',
            ),
          ),
          SizedBox(height: 12),
          
          _buildPartnerCard(
            context,
            'assets/ig.png',
            'Sup Galilée - Ingénieurs ',
            const PartnerDetailPage(
              imageUrl: 'assets/ig.png',
              title: 'Sup Galilée – Ingénieurs',
            ),
          ),
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
                errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey, width: 150),
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
      backgroundColor: Colors.transparent,
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
              errorBuilder: (context, error, stackTrace) => Container(height: 200, color: Colors.grey),
            ),
            SizedBox(height: 20),
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