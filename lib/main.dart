import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_page.dart';
import 'icon_list_view_page.dart';

void main() {
  runApp(const ProviderScope(child: AnimalCrossingNewHorizonWiki()));
}

class AnimalCrossingNewHorizonWiki extends StatelessWidget {
  const AnimalCrossingNewHorizonWiki({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ACNH Wiki',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      routes: {
        'fish': (context) => const IconListViewPage(endpoint: 'fish'),
        'bugs': (context) => const IconListViewPage(endpoint: 'bugs'),
        'art': (context) => const IconListViewPage(endpoint: 'art'),
        'villagers': (context) => const IconListViewPage(endpoint: 'villagers'),
        'sea': (context) => const IconListViewPage(endpoint: 'sea'),
      },
    );
  }
}
