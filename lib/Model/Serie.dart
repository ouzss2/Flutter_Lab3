class Serie {
  final String title;
  final String image;
  final String description;

  const Serie(this.title, this.image, this.description);

  factory Serie.fromJson(Map<String, dynamic> json) {
    return Serie(
      json['title'],
      json['image'],
      json['description'],
    );
  }
}
