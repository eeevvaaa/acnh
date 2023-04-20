import 'dart:convert';

import 'package:acnh/utils/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'models/bug.dart';
import 'models/data_type.dart';
import 'models/fish.dart';
import '../providers/acnh_provider.dart';
import 'fish_dialog.dart';
import 'models/villager.dart';

class IconListViewPage extends HookConsumerWidget {
  final String endpoint;
  final DataType dataType;

  const IconListViewPage(
      {super.key, required this.endpoint, required this.dataType});

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
          final items = decodedData.values.map<dynamic>((jsonItem) {
            switch (dataType) {
              case DataType.fish:
                return Fish.fromJson(jsonItem);
              case DataType.villagers:
                return Villager.fromJson(jsonItem);
              case DataType.bugs:
                return Bug.fromJson(jsonItem);
              default:
                throw Exception('Invalid dataType');
            }
          }).toList();

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
                    builder: (context) => FishDialog(fishData: item),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(item.iconUri),
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
