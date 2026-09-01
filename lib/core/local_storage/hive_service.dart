import 'package:hive_flutter/hive_flutter.dart';
import '../../data/models/bookmark_model.dart';

class HiveService {
  static const String bookmarkBoxName = 'bookmarks';

  static Future<void> init() async {
    await Hive.initFlutter();

    if (!Hive.isAdapterRegistered(BookmarkModelAdapter().typeId)) {
      Hive.registerAdapter(BookmarkModelAdapter());
    }

    if (!Hive.isBoxOpen(bookmarkBoxName)) {
      await Hive.openBox<BookmarkModel>(bookmarkBoxName);
    }
  }

  static Box<BookmarkModel> getBookmarkBox() {
    if (!Hive.isBoxOpen(bookmarkBoxName)) {
      throw StateError(
        'Bookmark box is not initialized. Call HiveService.init() before using the repository.',
      );
    }

    return Hive.box<BookmarkModel>(bookmarkBoxName);
  }
}
