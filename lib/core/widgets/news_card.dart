
import 'package:flutter/material.dart';
import 'package:news_reader_app/data/models/article_model.dart';

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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          if (article.imageUrl != null)
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                article.imageUrl!,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            )
          else
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Icon(Icons.newspaper, size: 50, color: Colors.grey),
            ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        article.description,
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    article.isBookmarked
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                    color:
                    article.isBookmarked ? Colors.blue : Colors.grey,
                    size: 28,
                  ),
                  onPressed: onBookmarkTap,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}