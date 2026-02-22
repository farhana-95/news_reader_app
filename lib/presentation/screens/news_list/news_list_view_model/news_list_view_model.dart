
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_reader_app/core/services/mock_news_service.dart';
import 'package:news_reader_app/data/models/article_model.dart';
import 'package:news_reader_app/data/repositories/news_repository.dart';


final newsRepositoryProvider =
Provider((ref) => NewsRepository(MockNewsService()));

final newsProvider =
StateNotifierProvider<NewsViewModel, AsyncValue<List<Article>>>(
        (ref) => NewsViewModel(ref.read(newsRepositoryProvider)));

class NewsViewModel extends StateNotifier<AsyncValue<List<Article>>> {
  final NewsRepository repository;

  NewsViewModel(this.repository) : super(const AsyncLoading()) {
    fetchNews();
  }

  Future<void> fetchNews() async {
    try {
      final data = await repository.getNews();
      if (data.isEmpty) {
        state = const AsyncData([]);
      } else {
        state = AsyncData(data);
      }
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  void toggleBookmark(int index) {
    final list = [...state.value!];
    list[index].isBookmarked = !list[index].isBookmarked;
    state = AsyncData(list);
  }

  List<Article> get bookmarkedArticles {
    if (state.value == null) return [];
    return state.value!.where((a) => a.isBookmarked).toList();
  }
}