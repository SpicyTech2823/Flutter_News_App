import 'package:flutter/material.dart';
import 'package:news_app/data/datasources/news_remote_data_source.dart';
import 'package:news_app/data/repositories/news_respository_impl.dart';
import 'package:news_app/domain/entities/news.dart';
import 'package:news_app/domain/usecases/get_news.dart';
import 'package:news_app/presentation/pages/news_detail_page.dart';
import 'package:news_app/presentation/providers/news_provider.dart';
import 'package:news_app/presentation/widgets/recommendation_news_card.dart';

class Explore extends StatefulWidget {
  const Explore({super.key, this.newsProvider});

  final NewsProvider? newsProvider;

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedCategory = 0;

  final List<String> _categories = [
    'All',
    'Business',
    'Entertainment',
    'Health',
    'Science',
    'Sports',
    'Technology',
  ];

  late final NewsProvider _provider;

  @override
  void initState() {
    super.initState();
    _provider =
        widget.newsProvider ??
        NewsProvider(
          getNews: GetNews(NewsRepositoryImpl(NewsRemoteDataSource())),
        );
    _loadSelectedCategoryNews();
  }

  Future<void> _loadSelectedCategoryNews() async {
    await _provider.fetchNewsByCategory(_categories[_selectedCategory]);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Explore',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for news',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategory = index;
                    });
                    _loadSelectedCategoryNews();
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: _selectedCategory == index
                          ? Colors.blue
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        _categories[index],
                        style: TextStyle(
                          color: _selectedCategory == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Expanded(child: _buildNewsList()),
        ],
      ),
    );
  }

  Widget _buildNewsList() {
    if (_provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_provider.errorMessage != null) {
      return Center(child: Text(_provider.errorMessage!));
    }

    if (_provider.newsList.isEmpty) {
      return const Center(child: Text('No news found.'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _provider.newsList.length,
      itemBuilder: (context, index) {
        final News news = _provider.newsList[index];
        return RecommendationNewsCard(
          key: ValueKey(news.id),
          news: news,
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewsDetailPage(news: news),
              ),
            );
          },
        );
      },
    );
  }
}
