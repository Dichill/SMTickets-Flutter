import 'dart:convert';

EventsModel EventsModelFromJson(String str) =>
    EventsModel.fromJson(json.decode(str));

String EventsModelToJson(EventsModel data) => json.encode(data.toJson());

class EventsModel {
  EventsModel({
    this.articles,
  });

  List<Article> articles;

  factory EventsModel.fromJson(List<dynamic> json) => EventsModel(
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
