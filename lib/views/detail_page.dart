import 'package:flutter/material.dart';
import '../models/news_article.dart';

class DetailPage extends StatelessWidget {
  final NewsArticle article;

   DetailPage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.source?.name ?? 'Article')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            article.urlToImage != null
                ? Hero(
                    tag: article.url,
                    child: Image.network(article.urlToImage!),
                  )
                : Container(height: 200, color: Colors.grey),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text('Published: ${article.publishedAt}'),
                  const SizedBox(height: 16),
                  Text(article.description ?? 'No description available'),
                  const SizedBox(height: 16),
                  Text(article.content ?? 'No content available'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}