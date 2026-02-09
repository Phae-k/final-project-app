import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:html' as html;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: const AboutGTRPage(title: 'GTR Page'),
    );
  }
}

class AboutGTRPage extends StatefulWidget {
  const AboutGTRPage({super.key, required this.title});
  final String title;

  @override
  State<AboutGTRPage> createState() => _AboutGTRPageState();
}
class _AboutGTRPageState extends State<AboutGTRPage> {
  
  Future<void> _downloadAsset(String assetPath, String fileName) async {
   
    try {
      final ByteData data = await rootBundle.load(assetPath);
      final Uint8List bytes = data.buffer.asUint8List();
      
      if (kIsWeb) {
        final blob = html.Blob([bytes]);
        final url = html.Url.createObjectUrlFromBlob(blob);
        final _ = html.AnchorElement(href: url)
          ..setAttribute("download", fileName)
          ..click();
        html.Url.revokeObjectUrl(url);
      }
    } catch (e) {
      debugPrint("Error downloading $fileName: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final pic1 = Image.asset('assets/network.png');

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: SingleChildScrollView( 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              Text('The Department of Telecommunications and Networking at the Institute of Technology of Cambodia (ITC) provides a comprehensive education in modern communication infrastructure. It offers two distinct pathways: a five-year Engineer’s Degree and a two-year Associate Degree in Technology.',
              style: TextStyle(
                fontSize: 15, color: Colors.black,
                ),),

                SizedBox(height: 20),

            SizedBox(
              height: 400, 
              width: 300,
              child: pic1
              ),
              Text('-   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -'),

              Row(children: [
                Text('Engineering Degree:',
                      style: TextStyle(
                        fontSize: 14, color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton.icon(
                      onPressed: () => _downloadAsset('assets/gtr1.png', 'gtr1.png'),
                      icon: const Icon(Icons.download),
                      label: const Text("Download"),
                   ),
                   ],
                   ),

                   SizedBox(height: 10),

                   Row(children: [
                    Text('Associate Degree in Technology:',
                      style: TextStyle(
                        fontSize: 14, color: Colors.black,
                      ),
                    ),

                    SizedBox(width: 20),
                    ElevatedButton.icon(
                      onPressed: () => _downloadAsset('assets/gtr2.png', 'gtr2.png'),
                      icon: const Icon(Icons.download),
                      label: const Text("Download"),
                   ),
                   ],),
            ],
            
          ),
        
          
        ),
      ), 
    );
  } 
}