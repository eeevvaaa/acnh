import 'package:flutter/material.dart';

import 'models/fish.dart';

class FishDialog extends StatelessWidget {
  final Fish fishData;

  const FishDialog({super.key, required this.fishData});

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
                    fishData.imageUri,
                    height: 200,
                    width: 200,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  fishData.name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text('ID: ${fishData.id}'),
                const SizedBox(height: 8),
                Text('Availability: ${fishData.availability}'),
                const SizedBox(height: 8),
                Text('Price: ${fishData.price}'),
                const SizedBox(height: 8),
                Text('Price CJ: ${fishData.priceCJ}'),
                const SizedBox(height: 8),
                Text('Shadow: ${fishData.shadow}'),
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
