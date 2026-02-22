import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_reader_app/core/widgets/empty_state_widget.dart';
import 'package:news_reader_app/core/widgets/news_card.dart';
import 'news_list_view_model/news_list_view_model.dart';

class BookmarksScreen extends ConsumerWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsState = ref.watch(newsProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: const Text("Bookmarks"),
        centerTitle: true,
      ),
      body: newsState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text("Failed to load news")),
        data: (articles) {
          final bookmarks = articles.where((a) => a.isBookmarked).toList();

          if (bookmarks.isEmpty) {
            return const EmptyStateWidget(message: "No bookmarked articles");
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8),
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