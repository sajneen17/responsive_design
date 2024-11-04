import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveWidgetsExample extends StatelessWidget {
  const AdaptiveWidgetsExample({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      appBar: isIOS
          ? const CupertinoNavigationBar(
        middle: Text('Adaptive Widgets'),
        backgroundColor: Color(0xFF008080),
      )
          : AppBar(
        title: const Text('Adaptive Widgets Example'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: isIOS
            ? CupertinoButton(
          color: CupertinoColors.activeBlue,
          onPressed: () {
            showDescriptionDialog(context);
          },
          child: const Text('iOS Button'),
        )
            : ElevatedButton(
          onPressed: () {
            showDescriptionDialog(context);
          },
          child: const Text('Android Button'),
        ),
      ),
    );
  }

  void showDescriptionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.lightBlue[50],
          title: const Text(
            'Adaptive Widgets Information',
            style: TextStyle(color: Colors.blueAccent),
          ),
          content: const SingleChildScrollView(
            child: Text(
              'Adaptive widgets in Flutter help developers create UIs that adapt to different platforms (e.g., Android and iOS). '
                  'Using conditional checks like Theme.of(context).platform, Flutter allows you to render platform-specific widgets. '
                  'For example, you can show a CupertinoButton for iOS and an ElevatedButton for Android to ensure that users get a native experience on each platform.\n\n'
                  'Source code:\n'
                  'if (isIOS) {\n'
                  '  return CupertinoButton(\n'
                  '    color: CupertinoColors.activeBlue,\n'
                  '    onPressed: () {},\n'
                  '    child: const Text(\'iOS Button\'),\n'
                  '  );\n'
                  '} else {\n'
                  '  return ElevatedButton(\n'
                  '    onPressed: () {},\n'
                  '    child: const Text(\'Android Button\'),\n'
                  '  );\n'
                  '}',
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
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          ],
        );
      },
    );
  }
}
