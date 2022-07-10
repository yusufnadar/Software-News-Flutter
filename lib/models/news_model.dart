// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'dart:convert';

List<News> newsFromJson(String str) => List<News>.from(json.decode(str).map((x) => News.fromJson(x)));

String newsToJson(List<News> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class News {
  News({
    this.title,
    this.author,
    this.createdAt,
    this.image,
    this.newsDetail,
  });

  String? title;
  String? author;
  String? createdAt;
  String? image;
  String? newsDetail;

  factory News.fromJson(Map<String, dynamic> json) => News(
    title: json["title"],
    author: json["author"],
    createdAt: json["createdAt"],
    image: json["image"],
    newsDetail: json["newsDetail"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "author": author,
    "createdAt": createdAt,
    "image": image,
    "newsDetail": newsDetail,
  };
}
