import 'package:flutter_test/flutter_test.dart';

import 'package:news_app/main.dart';
import 'package:news_app/domain/entities/news.dart';
import 'package:news_app/domain/respositories/news_repository.dart';
import 'package:news_app/domain/usecases/get_news.dart';
import 'package:news_app/presentation/providers/news_provider.dart';

class _FakeNewsRepository extends NewsRepository {
  @override
  Future<List<News>> getTopHeadlines(String country) async => const [];
}

void main() {
  testWidgets('renders the onboarding page first', (WidgetTester tester) async {
    final getNews = GetNews(_FakeNewsRepository());
    final newsProvider = NewsProvider(getNews: getNews);

    await tester.pumpWidget(NewsApp(newsProvider: newsProvider));
    await tester.pump();

    expect(find.text('Welcome to OmniNews'), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);
  });
}
