import 'package:flutter/material.dart';

import 'models/villager.dart';

class VillagerDialog extends StatelessWidget {
  final Villager villagerData;

  const VillagerDialog({super.key, required this.villagerData});

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
                    villagerData.imageUri,
                    height: 200,
                    width: 200,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  villagerData.name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text('ID: ${villagerData.id}'),
                const SizedBox(height: 8),
                Text('Personality: ${villagerData.personality}'),
                const SizedBox(height: 8),
                Text('Birthday: ${villagerData.birthday}'),
                const SizedBox(height: 8),
                Text('Species: ${villagerData.species}'),
                const SizedBox(height: 8),
                Text('Gender: ${villagerData.gender}'),
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
