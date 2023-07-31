class Art {
  final int id;
  final String name;
  final String imageUri;
  final bool hasFake;
  final int buyPrice;
  final int sellPrice;

  Art(
      {required this.id,
      required this.name,
      required this.imageUri,
      required this.hasFake,
      required this.buyPrice,
      required this.sellPrice});

  factory Art.fromJson(Map<String, dynamic> json) {
    return Art(
      id: json['id'],
      name: json['name']['name-USen'],
      imageUri: json['image_uri'],
      hasFake: json['hasFake'],
      buyPrice: json['buy-price'],
      sellPrice: json['sell-price'],
    );
  }
}
