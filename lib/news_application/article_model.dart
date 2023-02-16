import 'package:news_app/news_application/source_model.dart';

class ArticleModel {
  SourceModel source;
  String? author;
  String title;
  String? description;
  String? url;
  String? urlToImage;
  String publishedAt;
  String? content;

  ArticleModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> data) {
    return ArticleModel(
      source: SourceModel.fromJson(data["source"]),
      author: data["author"],
      title: data["title"],
      description: data["description"],
      url: data["url"],
      urlToImage: data["urlToImage"],
      publishedAt: data["publishedAt"],
      content: data["content"],
    );
  }
}
