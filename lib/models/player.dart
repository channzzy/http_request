class Player {
  String? name, position, imageUrl;
  String id;
  DateTime? createdAt;

  Player(
      {this.position,
      required this.id,
      this.imageUrl,
      this.name,
      this.createdAt});
}
