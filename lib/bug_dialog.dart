import 'package:flutter/material.dart';

import 'models/bug.dart';

class BugDialog extends StatelessWidget {
  final Bug bugData;

  const BugDialog({super.key, required this.bugData});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    bugData.imageUri,
                    height: 200,
                    width: 200,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  bugData.name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text('ID: ${bugData.id}'),
                const SizedBox(height: 8),
                Text('Availability: ${bugData.availability}'),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
