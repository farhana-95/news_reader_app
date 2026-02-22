import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_reader_app/core/widgets/empty_state_widget.dart';
import 'package:news_reader_app/core/widgets/error_state_widget.dart';
import 'package:news_reader_app/core/widgets/loading_state_widget.dart';
import 'package:news_reader_app/core/widgets/news_card.dart';
import 'package:news_reader_app/presentation/screens/login_screen/login_view_model/login_view_model.dart';
import 'book_mark_screen.dart';
import 'news_list_view_model/news_list_view_model.dart';

class NewsListScreen extends ConsumerWidget {
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(newsProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Top Headlines",
          style: TextStyle(color: Colors.white),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            color: Colors.white,
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),

      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Center(
                child: Text(
                  "News Reader App",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.bookmark),
              title: Text("Bookmarks"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const BookmarksScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                ref.read(loginProvider.notifier).logout();

                Navigator.pushNamedAndRemoveUntil(
                  context,
                  "/",
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),

      body: Container(
        color: Colors.grey.shade100,
        child: state.when(
          loading: () => LoadingWidget(),
          error: (e, _) =>
              const ErrorStateWidget(message: "Failed to load news"),
          data: (articles) {
            if (articles.isEmpty) {
              return const EmptyStateWidget(message: "No news available");
            }

            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return NewsCard(
                  article: article,
                  onBookmarkTap: () {
                    ref.read(newsProvider.notifier).toggleBookmark(index);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
