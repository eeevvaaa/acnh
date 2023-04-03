import 'package:flutter/material.dart';

import 'package:acnh/home_page.dart';

void main() {
  runApp(const AnimalCrossingNewHorizonWiki());
}

class AnimalCrossingNewHorizonWiki extends StatelessWidget {
  const AnimalCrossingNewHorizonWiki({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ACNH Wiki',
      home: HomePage(title: 'ACNH Wiki'),
    );
  }
}
