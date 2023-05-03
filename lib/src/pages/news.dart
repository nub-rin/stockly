import 'package:flutter/material.dart';
import 'package:stockly/src/widgets/news_card.dart';
import 'package:stockly/src/models/news.dart';
import 'package:stockly/src/utils/news_api.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late List<News> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipies();
  }

  Future<void> getRecipies() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
    // print(_recipes.length);
    // print(_recipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(right: 55),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.newspaper),
              SizedBox(width: 10),
              Text('News'),
            ],
          ),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _recipes.length,
              itemBuilder: (context, index) {
                return NewsCards(
                  title: _recipes[index].title,
                  source: _recipes[index].source,
                  date: _recipes[index].date,
                  link: _recipes[index].link,
                );
              },
            ),
    );
  }
}
