import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final acnhProvider =
    FutureProvider.family<String, String>((ref, endpoint) async {
  final response = await http.get(Uri.parse('http://acnhapi.com/v1/$endpoint'));
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load data');
  }
});
