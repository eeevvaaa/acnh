import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SeaCreaturesPage extends StatefulWidget {
  const SeaCreaturesPage({Key? key}) : super(key: key);

  @override
  State<SeaCreaturesPage> createState() => _SeaCreaturesPageState();
}

class _SeaCreaturesPageState extends State<SeaCreaturesPage> {
  late List<String> _iconUrls = [];

  @override
  void initState() {
    super.initState();
    _getSeaCreatureData();
  }

  Future<void> _getSeaCreatureData() async {
    final response = await http.get(Uri.parse('http://acnhapi.com/v1/sea'));
    final data = json.decode(response.body) as Map<String, dynamic>;
    final seaCreatures = data.values.toList();
    _iconUrls = seaCreatures
        .map((creature) => creature['icon_uri'].toString())
        .toList()
        .cast<String>();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sea Creatures'),
      ),
      body: ListView.builder(
        itemCount: _iconUrls.length,
        itemBuilder: (context, index) {
          return Image.network(
            _iconUrls[index],
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error_outline);
            },
          );
        },
      ),
    );
  }
}
