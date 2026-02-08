import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class AcademicYear extends StatefulWidget {
  const AcademicYear({super.key, required this.title});

  final String title;

  @override
  State<AcademicYear> createState() => _AcademicYearState();
}

class _AcademicYearState extends State<AcademicYear> {
  MobileScannerController scanner = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color.fromARGB(255, 185, 185, 188),
      
      appBar: AppBar(
        backgroundColor: Colors.white,
       
        surfaceTintColor: Colors.white, // Removes the grey tint on scroll
        scrolledUnderElevation: 0,      // Keeps elevation at 0 when scrolling
        
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: false,
        titleSpacing: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildDateCard("2025-2026", "01/10/2025", "04/07/2026"),
            const SizedBox(height: 16),
            _buildDateCard("2025-2026", "23/7/2025", "1/1/2026"),
            const SizedBox(height: 16),
            _buildDateCard("2024-2025", "1/11/2024", "1/10/2025"),
            const SizedBox(height: 16),
            _buildDateCard("2025-2026", "23/7/2025", "1/1/2026"),
            const SizedBox(height: 16),
            _buildDateCard("2025-2026", "23/7/2025", "1/1/2026"),
            const SizedBox(height: 16),
            _buildDateCard("2025-2026", "23/7/2025", "1/1/2026"),
            const SizedBox(height: 16),
            _buildDateCard("2025-2026", "23/7/2025", "1/1/2026"),
            const SizedBox(height: 16),
            _buildDateCard("2023-2024", "1/12/2023", "30/9/2024"),
          ],
        ),
      ),
    );
  }

  Widget _buildDateCard(String yearRange, String startDate, String endDate) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              yearRange,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const Divider(height: 1, color: Color(0xFFEEEEEE)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildDateRow("Start date (D/M/Y)", startDate),
                const SizedBox(height: 20),
                _buildDateRow("End date (D/M/Y)", endDate),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateRow(String label, String date) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.calendar_today_outlined,
              color: Colors.black87, size: 24),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: const TextStyle(color: Colors.grey, fontSize: 13)),
            const SizedBox(height: 2),
            Text(date,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
      ],
    );
  }
}