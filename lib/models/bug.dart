class Bug {
  final int id;
  final String name;
  final String iconUri;
  final String imageUri;
  final String availability;
  final int price;
  final int priceFlick;

  Bug(
      {required this.id,
      required this.name,
      required this.iconUri,
      required this.imageUri,
      required this.availability,
      required this.price,
      required this.priceFlick});

  factory Bug.fromJson(Map<String, dynamic> json) {
    return Bug(
        id: json['id'],
        name: json['name']['name-USen'],
        iconUri: json['icon_uri'],
        imageUri: json['image_uri'],
        availability: json['availability']['month-array-northern'].toString(),
        price: json['price'],
        priceFlick: json['price-flick']);
  }
}
