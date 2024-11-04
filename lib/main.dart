import 'package:flutter/material.dart';
import 'media_query.dart';
import 'layout_builder.dart';
import 'adaptive_widgets.dart';

void main() {
  runApp(const ResponsiveDesign());
}

class ResponsiveDesign extends StatelessWidget {
  const ResponsiveDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Design',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Responsive Design')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ElevatedButton(
            child: const Text('MediaQuery'),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MediaQueryExample()),
            ),
          ),
          ElevatedButton(
            child: const Text('LayoutBuilder'),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LayoutBuilderExample()),
            ),
          ),
          ElevatedButton(
            child: const Text('Adaptive Widgets'),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AdaptiveWidgetsExample()),
            ),
          ),
        ],
      ),
    );
  }
}
