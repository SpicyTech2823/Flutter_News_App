import '../../core/local_storage/hive_service.dart';
import '../../domain/entities/news.dart';
import '../../data/models/bookmark_model.dart';

class BookmarkRepository {
  // Get all bookmarks news
  List<News> getAllBookmarks() {
    final box = HiveService.getBookmarkBox();
    return box.values.map((bookmark) => bookmark.toNews()).toList();
  }

  // Check whether an article is bookmarked
  bool isBookmarked(String newsId) {
    final box = HiveService.getBookmarkBox();
    return box.containsKey(newsId);
  }

  // Add a news article to bookmarks
  Future<void> addBookmark(News news) async {
    final box = HiveService.getBookmarkBox();
    final bookmarkModel = BookmarkModel.fromNews(news);
    await box.put(news.id, bookmarkModel);
  }

  // Remove a news article from bookmarks
  Future<void> removeBookmark(String newsId) async {
    final box = HiveService.getBookmarkBox();
    await box.delete(newsId);
  }

  // Toggle bookmark
  Future<void> toggleBookmark(News news) async {
    if (isBookmarked(news.id)) {
      await removeBookmark(news.id);
    } else {
      await addBookmark(news);
    }
  }
}
