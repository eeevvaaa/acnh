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
  late List<Map<String, dynamic>> _items = [];

  @override
  void initState() {
    super.initState();
    _getIconData();
  }

  Future<void> _getIconData() async {
    final response =
        await http.get(Uri.parse('http://acnhapi.com/v1/${widget.endpoint}'));
    final data = json.decode(response.body) as Map<String, dynamic>;
    _items = data.values.toList().cast<Map<String, dynamic>>();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _items.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
              ),
              itemCount: _items.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          title: Text(_items[index]['name']['name-USen']),
                          content: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.network(
                                    _items[index]['image_uri'].toString()),
                                const SizedBox(height: 8),
                                if (_items[index]['availability'] &&
                                    (_items[index]['availability']['location']
                                            as String)
                                        .isNotEmpty)
                                  Text(
                                      'Location: ${_items[index]['availability']['location']}'),
                                if (_items[index]['availability']['rarity'] !=
                                        null &&
                                    (_items[index]['availability']['rarity']
                                            as String)
                                        .isNotEmpty)
                                  Text(
                                      'Rarity: ${_items[index]['availability']['rarity']}'),
                                Text('Sell price: ${_items[index]['price']}'),
                              ],
                            ),
                          ));
                    },
                  );
                },
                child: Image.network(_items[index]['icon_uri'].toString()),
              ),
            ),
    );
  }
}
