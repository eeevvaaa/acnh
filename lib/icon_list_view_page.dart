import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IconListViewPage extends StatefulWidget {
  const IconListViewPage(
      {Key? key, required this.endpoint, required this.title})
      : super(key: key);

  final String endpoint;
  final String title;

  @override
  State<IconListViewPage> createState() => _IconListViewPageState();
}

class _IconListViewPageState extends State<IconListViewPage> {
  late List<String> _iconUrls = [];

  @override
  void initState() {
    super.initState();
    _getIconData();
  }

  Future<void> _getIconData() async {
    final response =
        await http.get(Uri.parse('http://acnhapi.com/v1/${widget.endpoint}'));
    final data = json.decode(response.body) as Map<String, dynamic>;
    final items = data.values.toList();
    _iconUrls = items
        .map((item) => item['icon_uri'].toString())
        .toList()
        .cast<String>();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _iconUrls == null
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
              ),
              itemCount: _iconUrls.length,
              itemBuilder: (context, index) => Image.network(_iconUrls[index]),
            ),
    );
  }
}
