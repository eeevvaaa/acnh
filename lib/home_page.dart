import 'package:flutter/material.dart';
import 'package:acnh/sea_creature_page.dart';
import 'package:acnh/presentation/theme/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ACNH Wiki'),
      ),
      body: Center(
          child: Column(children: [
        TextButton(
          onPressed: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const SeaCreaturesPage(),
              ),
            );
          },
          child: const Text('Sea Creatures'),
        ),
        const TextButton(
          onPressed: null,
          child: Text('Fish'),
        )
      ])),
    );
  }
}
