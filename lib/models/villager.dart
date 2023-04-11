class Villager {
  final String id;
  final String name;
  final String iconUri;
  final String imageUri;
  final String personality;
  final String birthday;
  final String species;
  final String gender;

  Villager(
      {required this.id,
      required this.name,
      required this.iconUri,
      required this.imageUri,
      required this.personality,
      required this.birthday,
      required this.species,
      required this.gender});

  factory Villager.fromJson(Map<String, dynamic> json) {
    return Villager(
        id: json['id'],
        name: json['name']['name-USen'],
        iconUri: json['icon_uri'],
        imageUri: json['image_uri'],
        personality: json['personality'],
        birthday: json['birthday-string'],
        species: json['species'],
        gender: json['gender']);
  }
}
