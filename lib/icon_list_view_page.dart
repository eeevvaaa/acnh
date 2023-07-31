import 'dart:convert';

import 'package:acnh/bug_dialog.dart';
import 'package:acnh/sea_dialog.dart';
import 'package:acnh/utils/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'art_dialog.dart';
import 'models/art.dart';
import 'models/bug.dart';
import 'models/data_type.dart';
import 'models/fish.dart';
import '../providers/acnh_provider.dart';
import 'fish_dialog.dart';
import 'models/sea.dart';
import 'models/villager.dart';
import 'villager_dialog.dart';

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
              case DataType.sea:
                return Sea.fromJson(jsonItem);
              case DataType.art: // Add this case
                return Art.fromJson(jsonItem);
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
                    builder: (context) {
                      switch (dataType) {
                        case DataType.fish:
                          return FishDialog(fishData: item as Fish);
                        case DataType.villagers:
                          return VillagerDialog(villagerData: item as Villager);
                        case DataType.bugs:
                          return BugDialog(bugData: item as Bug);
                        case DataType.sea:
                          return SeaDialog(seaData: item as Sea);
                        case DataType.art:
                          return ArtDialog(artData: item as Art);
                        default:
                          throw Exception('Invalid dataType');
                      }
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    dataType == DataType.art ? item.imageUri : item.iconUri,
                  ),
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
