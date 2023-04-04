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
    final buttons = [
      HomeButton(text: 'Sea Creatures', endpoint: 'sea'),
      HomeButton(text: 'Fish', endpoint: 'fish'),
      HomeButton(text: 'Bugs', endpoint: 'bugs'),
      // HomeButton(text: 'Art', endpoint: 'art'),
      HomeButton(text: 'Villagers', endpoint: 'villagers')
    ];
    return MaterialApp(
      title: 'ACNH Wiki',
      home: HomePage(
        buttons: buttons,
      ),
    );
  }
}
