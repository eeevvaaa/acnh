import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:acnh/button.dart';

import '../models/category.dart';

class HomePage extends HookWidget {
  final categories = [
    Category(name: 'Fish', endpoint: 'fish'),
    Category(name: 'Bugs', endpoint: 'bugs'),
    Category(name: 'Art', endpoint: 'art'),
    Category(name: 'Villagers', endpoint: 'villagers'),
    Category(name: 'Sea Creatures', endpoint: 'sea'),
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
              Navigator.pushNamed(context, category.endpoint);
            },
          );
        },
      ),
    );
  }
}
