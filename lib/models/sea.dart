class Sea {
  final int id;
  final String name;
  final String iconUri;
  final String imageUri;
  final String availability;
  final int price;
  final String speed;
  final String shadow;

  Sea(
      {required this.id,
      required this.name,
      required this.iconUri,
      required this.imageUri,
      required this.availability,
      required this.price,
      required this.speed,
      required this.shadow});

  factory Sea.fromJson(Map<String, dynamic> json) {
    return Sea(
        id: json['id'],
        name: json['name']['name-USen'],
        iconUri: json['icon_uri'],
        imageUri: json['image_uri'],
        availability: json['availability']['month-array-northern'].toString(),
        price: json['price'],
        speed: json['speed'],
        shadow: json['shadow']);
  }
}
