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
      onGenerateRoute: (settings) {
        if (settings.name == null) {
          return MaterialPageRoute(
            builder: (context) => HomePage(),
          );
        }

        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => IconListViewPage(
            endpoint: args['endpoint'],
            dataType: args['dataType'],
          ),
        );
      },
    );
  }
}
