import 'dart:convert';

import 'package:acnh/utils/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/item.dart';
import '../providers/acnh_provider.dart';
import './item_dialog.dart';

class IconListViewPage extends HookConsumerWidget {
  final String endpoint;

  const IconListViewPage({super.key, required this.endpoint});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsAsyncValue = ref.watch(acnhProvider(endpoint));

    return Scaffold(
      appBar: AppBar(
        title: Text('ACNH ${endpoint.capitalize()} Wiki'),
      ),
      body: itemsAsyncValue.when(
        data: (response) {
          final decodedData = jsonDecode(response) as Map<String, dynamic>;
          final items = decodedData.values
              .map<Item>((jsonItem) => Item.fromJson(jsonItem))
              .toList();

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              return InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => ItemDialog(item: item),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(item.iconUrl),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
