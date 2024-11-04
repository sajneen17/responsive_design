import 'package:flutter/material.dart';

class MediaQueryExample extends StatelessWidget {
  const MediaQueryExample({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape = size.width > size.height;

    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: const Text('MediaQuery'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: isLandscape ? size.width * 0.7 : size.width * 0.9,
              height: isLandscape ? size.height * 0.5 : size.height * 0.3,
              color: Colors.blueAccent,
              child: Center(
                child: Text(
                  'Responsive UI with MediaQuery',
                  style: TextStyle(
                    fontSize: isLandscape ? 24 : 18,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDescriptionDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              child: const Text('Learn More'),
            ),
          ],
        ),
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
            style: TextStyle(color: Colors.blue),
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
              style: TextStyle(color: Colors.black87), // Content text color
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Close',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        );
      },
    );
  }
}
