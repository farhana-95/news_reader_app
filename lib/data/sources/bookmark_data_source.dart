import 'package:shared_preferences/shared_preferences.dart';
import 'package:news_reader_app/core/constants/app_constants.dart';

class BookmarkDataSource {
  Future<Set<String>> getBookmarkedIds() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(AppConstants.bookmarksKey) ?? [];
    return list.toSet();
  }

  Future<void> addBookmark(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(AppConstants.bookmarksKey) ?? [];
    if (!list.contains(id)) {
      list.add(id);
      await prefs.setStringList(AppConstants.bookmarksKey, list);
    }
  }

  Future<void> removeBookmark(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(AppConstants.bookmarksKey) ?? [];
    list.remove(id);
    await prefs.setStringList(AppConstants.bookmarksKey, list);
  }
}
