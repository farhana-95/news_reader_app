import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/widgets/empty_state_widget.dart';
import '../../../core/widgets/news_card.dart';
import 'news_list_view_model/news_list_view_model.dart';

class BookmarksScreen extends ConsumerWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsState = ref.watch(newsProvider);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text("Bookmarks", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0xff6a11cb),
      ),
      body: newsState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => const Center(child: Text("Failed to load news")),
        data: (articles) {
          final bookmarks = articles.where((a) => a.isBookmarked).toList();

          if (bookmarks.isEmpty) {
            return const EmptyStateWidget(message: "No bookmarked articles");
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: bookmarks.length,
            itemBuilder: (context, index) {
              final article = bookmarks[index];
              final articleIndex = articles.indexOf(article);

              return NewsCard(
                article: article,
                onBookmarkTap: () {
                  ref.read(newsProvider.notifier).toggleBookmark(articleIndex);
                },
              );
            },
          );
        },
      ),
    );
  }
}
