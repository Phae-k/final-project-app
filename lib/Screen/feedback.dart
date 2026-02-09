import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const FeedBackPage(title: 'Scanner Page'),
    );
  }
}

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({super.key, required this.title});

  final String title;

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  MobileScannerController scanner = MobileScannerController();
  
  @override
  void initState() {
    super.initState();
    init();
  }
  
  void init() {}

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[


            Text("មិនមានការចូលរួមយោបល់ "),
            Text("សូមធ្វើការចូលគណនីដើម្បីចូលរួមមតិយោបល់"),

          ],
        ),
      ), 
    );
  } 
}