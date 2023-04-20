import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_page.dart';
import 'icon_list_view_page.dart';
import 'models/data_type.dart';

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
        'fish': (context) =>
            const IconListViewPage(endpoint: 'fish', dataType: DataType.fish),
        'bugs': (context) =>
            const IconListViewPage(endpoint: 'bugs', dataType: DataType.bugs),
        'art': (context) =>
            const IconListViewPage(endpoint: 'art', dataType: DataType.art),
        'villagers': (context) => const IconListViewPage(
            endpoint: 'villagers', dataType: DataType.villagers),
        'sea': (context) =>
            const IconListViewPage(endpoint: 'sea', dataType: DataType.sea),
      },
    );
  }
}
