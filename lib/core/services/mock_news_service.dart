import 'package:news_reader_app/data/models/article_model.dart';

class MockNewsService {
  Future<List<Article>> fetchNews() async {
    await Future.delayed(const Duration(seconds: 2));

    return [
      Article(
        title: "Flutter 3 Released",
        description: "Flutter 3 comes with major performance improvements.",
        imageUrl:
        "https://images.pexels.com/photos/3183150/pexels-photo-3183150.jpeg",
      ),
      Article(
        title: "Riverpod Best Practices",
        description: "How to use Riverpod efficiently in production apps.",
      ),
      Article(
        title: "Dart 3 New Features",
        description: "Records and pattern matching improve Dart productivity.",
      ),
      Article(
        title: "Google Announces New AI Model",
        description: "Google released a new AI model competing with ChatGPT.",
        imageUrl:
        "https://images.pexels.com/photos/3861969/pexels-photo-3861969.jpeg",
      ),
      Article(
        title: "Apple Launches New iPhone",
        description: "Apple introduces the latest iPhone with USB-C port.",
        imageUrl:
        "https://images.pexels.com/photos/607812/pexels-photo-607812.jpeg",
      ),
      Article(
        title: "Meta Releases New VR Headset",
        description: "Meta launches next-gen VR headset for developers.",
      ),
      Article(
        title: "Cybersecurity Threats Rising",
        description: "Experts warn about increasing ransomware attacks.",
      ),
      Article(
        title: "OpenAI Expands Developer Tools",
        description: "New APIs help developers build AI-powered apps faster.",
      ),
      Article(
        title: "Tesla Announces New Battery Tech",
        description: "Tesla claims new batteries last 20% longer.",
      ),
      Article(
        title: "Global Tech Hiring Trends 2026",
        description: "Remote jobs and AI roles are growing rapidly.",
      ),
    ];
  }
}