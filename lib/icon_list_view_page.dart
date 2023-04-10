import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
    final items = useState<List<Item>?>(null);

    useEffect(() {
      itemsAsyncValue.whenData((response) {
        final decodedData = jsonDecode(response) as Map<String, dynamic>;
        items.value = decodedData.values
            .map<Item>((jsonItem) => Item.fromJson(jsonItem))
            .toList();
      });
    }, [itemsAsyncValue]);

    return Scaffold(
      appBar: AppBar(
        title: Text('ACNH $endpoint'),
      ),
      body: items.value == null
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemCount: items.value!.length,
              itemBuilder: (context, index) {
                final item = items.value![index];

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
            ),
    );
  }
}
