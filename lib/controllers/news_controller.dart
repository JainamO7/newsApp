import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/news_article.dart';

class NewsController extends GetxController {
  var articles = <NewsArticle>[].obs; // Observable list of articles
  var filteredArticles = <NewsArticle>[].obs; // Filtered list for search
  var isLoading = true.obs;

  final String apiKey = 'YOUR_API_KEY'; // Replace with your NewsAPI key
  final String baseUrl = 'https://saurav.tech/NewsAPI/top-headlines/category/sports/in.json';

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  Future<void> fetchNews() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('$baseUrl'));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['status'] == 'ok') {
          articles.value = (jsonData['articles'] as List)
              .map((article) => NewsArticle.fromJson(article))
              .toList();
          filteredArticles.value = articles; // Initialize filtered list
        } else {
          Get.snackbar('Error', 'API returned status: ${jsonData['status']}');
        }
      } else {
        Get.snackbar('Error', 'Failed to fetch news: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading(false);
    }
  }

  void searchArticles(String query) {
    if (query.isEmpty) {
      filteredArticles.value = articles;
    } else {
      filteredArticles.value = articles
          .where((article) =>
              article.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}