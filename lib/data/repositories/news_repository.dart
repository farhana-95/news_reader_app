import 'package:news_reader_app/core/services/mock_news_service.dart';
import 'package:news_reader_app/data/models/article_model.dart';

class NewsRepository {
  final MockNewsService service;

  NewsRepository(this.service);

  Future<List<Article>> getNews() => service.fetchNews();
}