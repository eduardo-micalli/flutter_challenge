
class Repository {
  final int id;
  final String? name;
  final String? description;
  final DateTime? createdAt;
  final String? language;
  final int? stars;
  bool isSaved;

  Repository(
      {required this.id,
      this.name,
      this.description,
      this.createdAt,
      this.language,
      this.stars,
      this.isSaved = false});

  void toggleSaved() {
    isSaved = !isSaved;
  }
}
