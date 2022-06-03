import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const webUrl = 'https://flutter.dev';
const telNumber = 'tel:117';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter URL LAUNCHER'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 100.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            ContainerWidget(
              label: 'flutter.dev',
              url: webUrl,
              icon: Icons.flutter_dash,
            ),
            SizedBox(
              height: 50.0,
            ),
            ContainerWidget(
              label: '時報',
              url: telNumber,
              icon: Icons.settings_phone,
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ContainerWidget extends StatelessWidget {
  final String label;
  final String url;
  final IconData icon;

  const ContainerWidget({
    Key? key,
    required this.url,
    required this.label,
    required this.icon,
  }) : super(key: key);

  void _launchUrl(String url) async {
    final Uri parsedUrl = Uri.parse(url);
    if (!await launchUrl(parsedUrl)) throw 'Could not launch $parsedUrl';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      decoration: BoxDecoration(
        color: Colors.blue.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(
        20.0,
      ),
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              _launchUrl(url);
            },
            icon: Icon(icon),
            iconSize: 80.0,
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 36.0),
          ),
        ],
      ),
    );
  }
}
