import 'package:flutter/material.dart';

class SemesterOnePage extends StatelessWidget {
  const SemesterOnePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Semester I")),
      body: const Center(child: Text("Welcome to Semester I Page")),

    );
  }
}