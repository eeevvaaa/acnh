class Item {
  final String id;
  final String name;
  final String iconUrl;
  final String imageUrl;
  final String availability;

  Item({
    required this.id,
    required this.name,
    required this.iconUrl,
    required this.imageUrl,
    required this.availability,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'].toString(),
      name: json['name']['name-USen'],
      iconUrl: json['icon_uri'],
      imageUrl: json['image_uri'],
      availability: json['availability']['month-array-northern'].toString(),
    );
  }
}
