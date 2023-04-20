import 'package:flutter/material.dart';

import 'models/sea.dart';

class SeaDialog extends StatelessWidget {
  final Sea seaData;

  const SeaDialog({super.key, required this.seaData});

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
                    seaData.imageUri,
                    height: 200,
                    width: 200,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  seaData.name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text('ID: ${seaData.id}'),
                const SizedBox(height: 8),
                Text('Availability: ${seaData.availability}'),
                const SizedBox(height: 8),
                Text('Price: ${seaData.price}'),
                const SizedBox(height: 8),
                Text('Speed: ${seaData.speed}'),
                const SizedBox(height: 8),
                Text('Shadow: ${seaData.shadow}'),
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
