import 'package:flutter/material.dart';
import 'package:news_app/presentation/providers/news_provider.dart';
import '../widgets/breaking_news_card.dart';
import '../widgets/recommendation_news_card.dart';
import '../widgets/section_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.newsProvider});
  final NewsProvider newsProvider;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    // Fetch news when the Home Screen opens.
    widget.newsProvider.fetchNews();

    // Listen for changes in the provider.
    widget.newsProvider.addListener(_refreshUI);
  }

  void _refreshUI() {
    // Rebuild the screen when API data changes.
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    // Remove listener when the screen is destroyed.
    widget.newsProvider.removeListener(_refreshUI);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = widget.newsProvider;
    return Scaffold(
      appBar: AppBar(title: const Text('News')),
      body: _buildBody(provider),
    );
  }

  Widget _buildBody(NewsProvider provider) {
    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (provider.errorMessage != null) {
      return Center(child: Text(provider.errorMessage!));
    }
    if (provider.newsList.isEmpty) {
      return const Center(child: Text('No news available'));
    }
    return RefreshIndicator(
      onRefresh: provider.fetchNews,
      child: ListView(
        children: [
          SectionHeader(
            title: 'Breaking News',
            onViewAll: () {
              // TODO: Navigate to all breaking news.
            },
          ),

          // Large breaking news card.
          BreakingNewsCard(news: provider.newsList[0]),

          const SizedBox(height: 20),
          SectionHeader(
            title: 'Recommendation',
            onViewAll: () {
              // TODO: Navigate to all recommendations.
            },
          ),

          // Display remaining newsList as recommendations.
          ...provider.newsList
              .skip(1)
              .map(
                (news) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: RecommendationNewsCard(news: news),
                ),
              ),
        ],
      ),
    );
  }
}
