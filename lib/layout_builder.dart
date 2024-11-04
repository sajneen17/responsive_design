import 'package:flutter/material.dart';

class LayoutBuilderExample extends StatelessWidget {
  const LayoutBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: const Text('LayoutBuilder'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                bool isWide = constraints.maxWidth > 600;
                return GridView.count(
                  crossAxisCount: isWide ? 4 : 2,
                  children: List.generate(8, (index) {
                    return Card(
                      color: Colors.purpleAccent,
                      margin: const EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          'Item $index',
                          style: TextStyle(fontSize: isWide ? 22 : 16, color: Colors.white),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                showDescriptionDialog(context);
              },
              child: const Text('Learn About MediaQuery'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showDescriptionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            'MediaQuery Information',
            style: TextStyle(color: Colors.teal),
          ),
          content: const SingleChildScrollView(
            child: Text(
              'MediaQuery in Flutter is used to obtain information about the device’s screen size, orientation, and other properties. '
                  'It allows developers to create responsive UIs that adapt to various screen dimensions.\n\n'
                  'Source code example:\n'
                  'final size = MediaQuery.of(context).size;\n'
                  'final isLandscape = size.width > size.height;\n'
                  '\n'
                  'Container(\n'
                  '  width: isLandscape ? size.width * 0.7 : size.width * 0.9,\n'
                  '  height: isLandscape ? size.height * 0.5 : size.height * 0.3,\n'
                  '  color: Colors.blueAccent,\n'
                  '  child: Center(\n'
                  '    child: Text(\n'
                  '      \'Responsive UI with MediaQuery\',\n'
                  '      style: TextStyle(\n'
                  '        fontSize: isLandscape ? 24 : 18,\n'
                  '        color: Colors.white,\n'
                  '      ),\n'
                  '    ),\n'
                  '  ),\n'
                  ');',
              style: TextStyle(color: Colors.black87),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Close',
                style: TextStyle(color: Colors.teal),
              ),
            ),
          ],
        );
      },
    );
  }
}
