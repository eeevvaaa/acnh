import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // return Column(children: const [Text('Sea Creatures')]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ACNH Wiki'),
      ),
      // body: Column(children: const [
      //   TextButton(onPressed: null, child: Text('Sea Creatures'))
      // ])
      body: Center(
          child: Column(children: const [
        TextButton(onPressed: null, child: Text('Sea Creatures'))
      ])),
    );
  }
}
