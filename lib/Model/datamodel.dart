import 'dart:convert';

Datafetch datafetchFromMap(String str) => Datafetch.fromMap(json.decode(str));

String datafetchToMap(Datafetch data) => json.encode(data.toMap());

class Datafetch {
  List<Search> search;
  String totalResults;
  String response;

  Datafetch({
    required this.search,
    required this.totalResults,
    required this.response,
  });

  factory Datafetch.fromMap(Map<String, dynamic> json) => Datafetch(
        search: List<Search>.from(json["Search"].map((x) => Search.fromMap(x))),
        totalResults: json["totalResults"],
        response: json["Response"],
      );

  Map<String, dynamic> toMap() => {
        "Search": List<dynamic>.from(search.map((x) => x.toMap())),
        "totalResults": totalResults,
        "Response": response,
      };
}

class Search {
  String title;
  String year;
  String imdbId;
  String type;
  String poster;

  Search({
    required this.title,
    required this.year,
    required this.imdbId,
    required this.type,
    required this.poster,
  });

  factory Search.fromMap(Map<String, dynamic> json) => Search(
        title: json["Title"],
        year: json["Year"],
        imdbId: json["imdbID"],
        type: json["Type"],
        poster: json["Poster"],
      );

  Map<String, dynamic> toMap() => {
        "Title": title,
        "Year": year,
        "imdbID": imdbId,
        "Type": type,
        "Poster": poster,
      };
}
