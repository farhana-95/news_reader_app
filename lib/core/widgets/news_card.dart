import 'package:flutter/material.dart';
import '../../data/models/article_model.dart';

class NewsCard extends StatelessWidget {
  final Article article;
  final VoidCallback onBookmarkTap;

  const NewsCard({
    super.key,
    required this.article,
    required this.onBookmarkTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        shadowColor: Colors.black26,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              child: article.imageUrl != null && article.imageUrl!.isNotEmpty
                  ? Image.network(
                article.imageUrl!,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              )
                  : Container(
                height: 200,
                width: double.infinity,
                color: Colors.grey,
                child: const Center(
                  child: Icon(
                    Icons.newspaper,
                    color: Colors.white70,
                    size: 60,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    article.description,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: onBookmarkTap,
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: article.isBookmarked
                                ? const Color(0xff6a11cb).withValues(alpha: 0.15)
                                : Colors.grey.shade200,
                          ),
                          child: Icon(
                            article.isBookmarked
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            color: article.isBookmarked
                                ? const Color(0xff6a11cb)
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}