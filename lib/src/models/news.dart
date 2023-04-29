import 'dart:convert';
import 'package:http/http.dart' as http;

class News {
  String title;
  String link;
  String date;
  String source;

  News(
    this.title,
    this.link,
    this.date,
    this.source,
  );

  factory News.fromJson(Map<String, dynamic> json) {
    return (News(json['title'], json['link'], json['pubDate'], json['source']));
  }
}
