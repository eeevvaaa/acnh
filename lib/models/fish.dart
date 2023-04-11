class Fish {
  final String id;
  final String name;
  final String iconUri;
  final String imageUri;
  final String availability;
  final String price;
  final String priceCJ;
  final String shadow;

  Fish(
      {required this.id,
      required this.name,
      required this.iconUri,
      required this.imageUri,
      required this.availability,
      required this.price,
      required this.priceCJ,
      required this.shadow});

  factory Fish.fromJson(Map<String, dynamic> json) {
    return Fish(
        id: json['id'],
        name: json['name']['name-USen'],
        iconUri: json['icon_uri'],
        imageUri: json['image_uri'],
        availability: json['availability']['month-array-northern'].toString(),
        price: json['price'],
        priceCJ: json['price-cj'],
        shadow: json['shadow']);
  }
}
