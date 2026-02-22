class Article {
  final String title;
  final String description;
  final String? imageUrl;
  bool isBookmarked;

  Article({
    required this.title,
    required this.description,
    this.imageUrl,
    this.isBookmarked = false,
  });
}