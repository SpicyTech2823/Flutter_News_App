import 'package:flutter/material.dart';

import '../providers/news_provider.dart';
import '../widgets/news_card.dart';

class HomePage extends StatefulWidget {
  final NewsProvider newsProvider;

  const HomePage({
    super.key,
    required this.newsProvider,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    // Load news when the screen is first created.
    widget.newsProvider.fetchNews();

    // Listen for changes from the provider.
    widget.newsProvider.addListener(_updateUI);
  }

  void _updateUI() {
    // Rebuild this page when provider data changes.
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    // Remove listener to prevent memory leaks.
    widget.newsProvider.removeListener(_updateUI);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = widget.newsProvider;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Latest News'),
      ),
      body: _buildBody(provider),
    );
  }

  Widget _buildBody(NewsProvider provider) {
    // Display loading indicator while fetching data.
    if (provider.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    // Display an error if the API request failed.
    if (provider.errorMessage != null) {
      return Center(
        child: Text(provider.errorMessage!),
      );
    }

    // Display message if there are no articles.
    if (provider.newsList.isEmpty) {
      return const Center(
        child: Text('No news found.'),
      );
    }

    // Display the news list.
    return RefreshIndicator(
      onRefresh: provider.fetchNews,
      child: ListView.builder(
        itemCount: provider.newsList.length,
        itemBuilder: (context, index) {
          final article = provider.newsList[index];

          return NewsCard(news: article);
        },
      ),
    );
  }
}