import 'package:flutter/material.dart';

import 'models/art.dart';

class ArtDialog extends StatelessWidget {
  final Art artData;

  const ArtDialog({super.key, required this.artData});

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
                    artData.imageUri,
                    height: 200,
                    width: 200,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  artData.name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text('ID: ${artData.id}'),
                const SizedBox(height: 8),
                Text('Has fake: ${artData.hasFake}'),
                const SizedBox(height: 8),
                Text('Buy price : ${artData.buyPrice}'),
                const SizedBox(height: 8),
                Text('Sell price: ${artData.sellPrice}'),
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
