import 'dart:convert';

VenuesModel venuesModelFromJson(String str) =>
    VenuesModel.fromJson(json.decode(str));

String venuesModelToJson(VenuesModel data) => json.encode(data.toJson());

class VenuesModel {
  VenuesModel({
    this.articles,
  });

  List<Article> articles;

  factory VenuesModel.fromJson(List<dynamic> json) => VenuesModel(
        articles: List<Article>.from(json.map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  Article({
    this.title,
    this.location,
    this.date,
    this.imgsrc,
    this.link,
  });

  String title;
  String location;
  String date;
  String imgsrc;
  String link;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        title: json['title'],
        location: json['location'],
        date: json['date'],
        imgsrc: json['image'],
        link: json['link'],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "location": location,
        "date": date,
        "imgsrc": imgsrc,
        "link": link,
      };
}
