import 'package:flutter/material.dart';

class HeadDepartmentPage extends StatelessWidget {
  const HeadDepartmentPage({super.key});

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
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),

        title: const Text(
          "Management Team",
          style: TextStyle(color: Colors.black, 
          ),
        ),
      ),
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/imageteacher.png'), // Ensure this asset exists
                  ),
                  SizedBox(height: 15),
                  
                  Text(
                    "SRENG SOKCHENDA", 
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Serif',
                    ),
                  ),
                  
                  Text(
                    "Head of Department",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            _buildSectionTitle("Vision"),
            _buildSectionBody(
              "“To be a training institution for human resources filled with technological capabilities, science, and ethics that effectively contributes to the development of communities and the nation.”",
            ),

            _buildSectionTitle("Mission"),
            _buildBulletPoint("To promote good governance and high professional standards for educators."),
            _buildBulletPoint("To provide technical education services, information technology, and clear guidelines."),
            _buildBulletPoint("To work with relevant stakeholders, including authorities at all levels and partner organizations for community development."),
            _buildBulletPoint("To enhance quality and ethics for students to become good citizens for their communities and the nation."),

            _buildSectionTitle("Values"),
            _buildBulletPoint("Good governance"),
            _buildBulletPoint("Collaboration"),
            _buildBulletPoint("Professionalism"),
            _buildBulletPoint("Ethics"),
            _buildBulletPoint("Gender"),
            _buildBulletPoint("Transparency"),
            _buildBulletPoint("Accountability"),
            
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }


  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 5),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSectionBody(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 15, height: 1.4),
    );
  }

  
  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(" • ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 15, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}