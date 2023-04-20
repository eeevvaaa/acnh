import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:acnh/button.dart';

import '../models/category.dart';
import '../models/data_type.dart';

class HomePage extends HookWidget {
  final categories = [
    Category(name: 'Fish', endpoint: 'fish', dataType: DataType.fish),
    Category(name: 'Bugs', endpoint: 'bugs', dataType: DataType.bugs),
    Category(
        name: 'Villagers', endpoint: 'villagers', dataType: DataType.villagers),
    Category(name: 'Sea Creatures', endpoint: 'sea', dataType: DataType.sea),
    Category(name: 'Art', endpoint: 'art', dataType: DataType.art),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ACNH Wiki'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];

          return Button(
            name: category.name,
            onPressed: () {
              // Add this line
              Navigator.pushNamed(
                context,
                category.endpoint,
                arguments: {
                  'endpoint': category.endpoint,
                  'dataType': category.dataType
                },
              );
            },
          );
        },
      ),
    );
  }
}
