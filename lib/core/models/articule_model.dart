// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ArticleModel {
  final int id;
  final String goal;
  final List<String> tags;
  final String title;
  final String author;
  final String content;
  final String imageUrl;
  final String publishedDate;

  ArticleModel({
    required this.id,
    required this.goal,
    required this.tags,
    required this.title,
    required this.author,
    required this.content,
    required this.imageUrl,
    required this.publishedDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'goal': goal,
      'tags': tags,
      'title': title,
      'author': author,
      'content': content,
      'imageUrl': imageUrl,
      'publishedDate': publishedDate,
    };
  }

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      id: map['id'] as int,
      goal: map['goal'] as String,
      tags: List<String>.from(map['tags'].map((x) => x.toString())),
      title: map['title'] as String,
      author: map['author'] as String,
      content: map['content'] as String,
      imageUrl: map['image_url'] as String,
      publishedDate: map['published_date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticleModel.fromJson(String source) => ArticleModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
