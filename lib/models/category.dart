import 'data_type.dart';

class Category {
  final String name;
  final String endpoint;
  final DataType dataType;

  Category(
      {required this.name, required this.endpoint, required this.dataType});
}
